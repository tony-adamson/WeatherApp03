//
//  WeatherVM.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation
import CoreData
import Combine
import Alamofire

class WeatherVM: ObservableObject {
    @Published var weatherDetail: WeatherModel?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private var context: NSManagedObjectContext
    
    init(weatherDetail: WeatherModel? = nil, context: NSManagedObjectContext) {
        self.weatherDetail = weatherDetail
        self.context = context
    }

    func loadFavoriteCityWeather() {
        isLoading = true
        fetchFavoriteCity { [weak self] city in
            guard let self = self, let city = city else {
                self?.isLoading = false
                return
            }
            self.weatherResponse(latitude: city.latitude, longitude: city.longitude)
        }
    }
    
    private func fetchFavoriteCity(completion: @escaping (City?) -> Void) {
        let request: NSFetchRequest<City> = City.fetchRequest()
        request.predicate = NSPredicate(format: "isFavorite == YES")
        request.fetchLimit = 1

        do {
            let cities = try context.fetch(request)
            completion(cities.first)
        } catch {
            print("Failed to fetch favorite city: \(error)")
            completion(nil)
        }
    }
    
    private func weatherResponse(latitude: Double, longitude: Double) {
        let apiKey = "cea831b26236c276a827eb036f9d8105"
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(apiKey)"

        AF.request(urlString).validate().responseDecodable(of: WeatherModel.self) { [weak self] response in
            defer { self?.isLoading = false }
            
            switch response.result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self?.weatherDetail = weatherData
                }
            case .failure(let error):
                print("Error fetching weather data: \(error)")
            }
        }
    }
}
