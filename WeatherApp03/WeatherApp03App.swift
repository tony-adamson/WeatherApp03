//
//  WeatherApp03App.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

@main
struct WeatherApp03App: App {
    @StateObject private var appSettings = AppSettings()
//    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
//    @State private var countriesAndCities = CountriesAndCities()
//    let persistenceController = PersistenceController.shared
    
//    init() {
//        if isFirstLaunch {
//            print("Это первый запуск приложения после установки")
//        } else {
//            print("Приложение уже запускалось ранее")
//        }
//    }

    
    var body: some Scene {
        WindowGroup {
            SelectorView()
                .environmentObject(appSettings)
//            if !isFirstLaunch {
//                AppView()
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            } else {
//                OnboardingView()
//                    .environment(countriesAndCities)
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
        }
    }
}
