//
//  WeatherView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    var city: City?
    
    var body: some View {
        VStack {
            WeatherHeaderView(city: city)
            
            // Weather information
            TabView {
                MainInformationView()
                
                DetailsView()
                
                ForecastView()
            }
            .tabViewStyle(.page)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        // Экземпляр WeatherVM с шаблонными данными
        let weatherVM = WeatherVM(weatherDetail: weatherModelTempale, context: PersistenceController.preview.container.viewContext)
        
        return WeatherView()
            .environmentObject(weatherVM)
    }
}
