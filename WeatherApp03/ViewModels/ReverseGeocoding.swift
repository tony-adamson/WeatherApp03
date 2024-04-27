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

    init() {
        initiateGeocodingProcess()
    }

    private func initiateGeocodingProcess() {
        locationManager.$currentLocation
            .compactMap { $0 }
            .first()
            .sink { [weak self] location in
                self?.fetchCityAndCountry(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
            .store(in: &cancellables)
    }

    private func fetchCityAndCountry(latitude: Double, longitude: Double) {
        let urlString = "https://api.api-ninjas.com/v1/reversegeocoding?lat=\(latitude)&lon=\(longitude)"
        let apiKey = "xxHCX9c1efbgDHJwTVg7Fw==syH6guZA0f8HPH28"
        
        let headers: HTTPHeaders = [
            "X-Api-Key": apiKey
        ]
        
        AF.request(urlString, headers: headers)
            .publishDecodable(type: [ReverseGeocodingModel].self)
            .value()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error occurred: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.locationDetail = response.first
            })
            .store(in: &cancellables)
    }
}
