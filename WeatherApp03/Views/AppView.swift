//
//  ContentView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct AppView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: City.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "isFavorite == YES")
    ) var favoriteCities: FetchedResults<City>
    @StateObject private var weatherVM = WeatherVM(context: PersistenceController.shared.container.viewContext)

    var body: some View {
        let city = favoriteCities.first
        NavigationStack {
            VStack {
                if weatherVM.isLoading {
                    Spinner()
                } else if let weather = weatherVM.weatherDetail {
                    WeatherView(city: city)
                } else {
                    Text("Weather data is not available.")
                }
            
            }
            .padding(30)
            .onAppear {
                if favoriteCities.isEmpty {
                    print("No favorite cities.")
                } else {
                    weatherVM.loadFavoriteCityWeather()
                }
            }
        }
        .environmentObject(weatherVM)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        // Экземпляр WeatherVM с шаблонными данными
        let weatherVM = WeatherVM(weatherDetail: weatherModelTempale, context: PersistenceController.preview.container.viewContext)
        
        return AppView()
            .environmentObject(weatherVM)
    }
}
