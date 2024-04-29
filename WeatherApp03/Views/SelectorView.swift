//
//  SelectorView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import SwiftUI

struct SelectorView: View {
    @State private var countriesAndCities = CountriesAndCities()
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var appSettings: AppSettings
    
    var body: some View {
        if !appSettings.isFirstLaunch {
            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            OnboardingView()
                .environment(countriesAndCities)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

#Preview {
    SelectorView()
}
