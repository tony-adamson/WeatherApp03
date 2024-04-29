//
//  ReverseGeocodingModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

class ReverseGeocoding: ObservableObject {
    @ObservedObject private var locationManager = LocationManager()
    var cancellables = Set<AnyCancellable>()
    @Published var locationDetail: ReverseGeocodingModel?
    private var latitude: Double?
    private var longitude: Double?

    init() {
        initiateGeocodingProcess()
    }

    private func initiateGeocodingProcess() {
        locationManager.$currentLocation
            .compactMap { $0 }
            .first()
            .sink { [weak self] location in
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                self?.fetchCityAndCountry(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
            .store(in: &cancellables)
    }

    private func fetchCityAndCountry(latitude: Double, longitude: Double) {
        let urlString = "https://api.api-ninjas.com/v1/reversegeocoding?lat=\(latitude)&lon=\(longitude)"
        let apiKey = "xxHCX9c1efbgDHJwTVg7Fw==syH6guZA0f8HPH28"
        let headers: HTTPHeaders = ["X-Api-Key": apiKey]

        AF.request(urlString, headers: headers)
            .publishDecodable(type: [ReverseGeocodingModel].self)
            .value()
            .receive(on: RunLoop.main)
            .flatMap { [weak self] response -> AnyPublisher<ReverseGeocodingModel, AFError> in
                guard let firstResult = response.first else {
                    return Fail(error: AFError.explicitlyCancelled).eraseToAnyPublisher()
                }
                return self?.fetchFullCountryName(code: firstResult.country)
                    .map { fullName in
                        var result = firstResult
                        result.fullName = fullName
                        return result
                    }
                    .eraseToAnyPublisher() ?? Fail(error: AFError.explicitlyCancelled).eraseToAnyPublisher()
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error occurred: \(error)")
                }
            }, receiveValue: { [weak self] result in
                self?.locationDetail = result
            })
            .store(in: &cancellables)
    }

    
    private func fetchFullCountryName(code: String) -> AnyPublisher<String, AFError> {
        let urlString = "https://restcountries.com/v3.1/alpha/\(code.lowercased())"
        return AF.request(urlString)
            .publishDecodable(type: [CountryDetailsResponse].self)
            .value()
            .map { response in
                response.first?.name.common ?? "Unknown"
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func saveLocationAsFavorite(isFavorite: Bool) {
            guard let detail = locationDetail, let lat = latitude, let lon = longitude else {
                print("Location data is not complete.")
                return
            }
            let context = PersistenceController.shared.container.viewContext
            let city = City(context: context)
            city.name = detail.name
            city.latitude = lat
            city.longitude = lon
            city.isFavorite = isFavorite

            do {
                try context.save()
                print("City saved as favorite successfully.")
            } catch {
                print("Failed to save city: \(error)")
            }
        }
}
