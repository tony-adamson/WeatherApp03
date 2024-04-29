//
//  DailyForecastItem.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct DailyForecastItem: View {
    var date: String
    var minTemp: Double
    var maxTemp: Double
    var iconName: String
    
    var body: some View {
        VStack {
            // Date text
            Text(date)
                .font(.custom("UbuntuCondensed-Regular", size: 12))
            
            // Weather image
            Image(systemName: iconName)
                .font(.custom("UbuntuCondensed-Regular", size: 24))
                .foregroundStyle(.black)
                .padding(.top, 10)
            
            // Temperature information
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "arrow.down")
                    Text("\(minTemp, specifier: "%.0f")°C")
                }
                
                HStack {
                    Image(systemName: "arrow.up")
                    Text("\(maxTemp, specifier: "%.0f")°C")
                }
            }
            .padding(.top, 10)
            .font(.custom("UbuntuCondensed-Regular", size: 12))
            .foregroundStyle(.greyWeather)
        }
    }
}

#Preview {
    DailyForecastItem(date: "26 Dec", minTemp: 16, maxTemp: 25, iconName: "cloud.drizzle")
}
