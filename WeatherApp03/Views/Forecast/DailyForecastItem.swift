//
//  DailyForecastItem.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct DailyForecastItem: View {
    var body: some View {
        VStack {
            // Date text
            Text("26 Dec")
                .font(.custom("UbuntuCondensed-Regular", size: 12))
            
            // Weather image
            Image(systemName: "cloud.drizzle")
                .font(.custom("UbuntuCondensed-Regular", size: 24))
                .foregroundStyle(.black)
                .padding(.top, 10)
            
            // Temperature information
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "arrow.down")
                    Text("16°C")
                }
                
                HStack {
                    Image(systemName: "arrow.up")
                    Text("26°C")
                }
            }
            .padding(.top, 10)
            .font(.custom("UbuntuCondensed-Regular", size: 12))
            .foregroundStyle(.greyWeather)
        }
    }
}

#Preview {
    DailyForecastItem()
}
