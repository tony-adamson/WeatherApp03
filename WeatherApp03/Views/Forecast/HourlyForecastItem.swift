//
//  HourlyForecastItem.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct HourlyForecastItem: View {
    var timeOfWeather: String
    var iconName: String
    
    var body: some View {
        VStack {
            // Time text
            Text(timeOfWeather)
                .font(.custom("UbuntuCondensed-Regular", size: 12))
            
            // Weather icon
            Image(systemName: iconName)
                .font(.custom("UbuntuCondensed-Regular", size: 24))
                .foregroundStyle(.black)
                .padding(.top, 10)
        }
    }
}

#Preview {
    HourlyForecastItem(timeOfWeather: "10:00", iconName: "cloud.drizzle")
}
