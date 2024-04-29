//
//  SelectorView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import SwiftUI

struct SelectorView: View {
//    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @State private var countriesAndCities = CountriesAndCities()
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var appSettings: AppSettings
    
//    init() {
//        if isFirstLaunch {
//            print("Это первый запуск приложения после установки")
//        } else {
//            print("Приложение уже запускалось ранее")
//        }
//    }
    
    var body: some View {
        if !appSettings.isFirstLaunch {
            AppView()
        } else {
            OnboardingView()
        }
//        if !isFirstLaunch {
//            AppView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        } else {
//            OnboardingView()
//                .environment(countriesAndCities)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
    }
}

#Preview {
    SelectorView()
}
