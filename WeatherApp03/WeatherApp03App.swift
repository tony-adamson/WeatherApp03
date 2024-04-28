//
//  WeatherApp03App.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

@main
struct WeatherApp03App: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State private var countriesAndCities = CountriesAndCities()
    
    init() {
        if isFirstLaunch {
            print("Это первый запуск приложения после установки")
            isFirstLaunch = false
        } else {
            print("Приложение уже запускалось ранее")
        }
    }

    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                AppView()
            } else {
                OnboardingView()
                    .environment(countriesAndCities)
            }
        }
    }
}
