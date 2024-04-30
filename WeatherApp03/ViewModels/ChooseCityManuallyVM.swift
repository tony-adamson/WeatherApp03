//
//  ChooseCityManuallyVM.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation

class ChooseCityManuallyVM: ObservableObject{
    
    func saveManuallyLocationAsFavorite(name: String, latitude: Double, longitude: Double, isFavorite: Bool) {
        let context = PersistenceController.shared.container.viewContext
        let city = City(context: context)
        city.name = name
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
