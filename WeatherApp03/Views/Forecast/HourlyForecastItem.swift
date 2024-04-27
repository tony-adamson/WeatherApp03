//
//  HourlyForecastItem.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct HourlyForecastItem: View {
    var body: some View {
        VStack {
            // Time text
            Text("10:00")
                .font(.custom("UbuntuCondensed-Regular", size: 12))
            
            // Weather icon
            Image(systemName: "cloud.drizzle")
                .font(.custom("UbuntuCondensed-Regular", size: 24))
                .foregroundStyle(.black)
                .padding(.top, 10)
        }
    }
}

#Preview {
    HourlyForecastItem()
}
