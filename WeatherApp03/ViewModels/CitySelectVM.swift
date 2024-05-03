//
//  CitySelectVM.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 02.05.2024.
//

import Foundation

class CitySelectViewModel: ObservableObject {
    @Published var filteredCities: [Cities] = []
    var allCities: [Cities] = []

    init(cities: [Cities]) {
        self.allCities = cities
    }

    func searchCities(with query: String) {
        if query.isEmpty {
            filteredCities = allCities
            filteredCities = Array(allCities.prefix(30))
        } else {
            let results = allCities.filter { $0.name.localizedCaseInsensitiveContains(query) }
            filteredCities = Array(results.prefix(30))
        }
    }
    
    func saveLocationAsFavorite(isFavorite: Bool, latitude: Double, longitude: Double, cityName: String) {
            let context = PersistenceController.shared.container.viewContext
            let city = City(context: context)
            city.name = cityName
            city.latitude = latitude
            city.longitude = longitude
            city.isFavorite = isFavorite

            do {
                try context.save()
                print("City saved as favorite successfully.")
            } catch {
                print("Failed to save city: \(error)")
            }
        }
}

