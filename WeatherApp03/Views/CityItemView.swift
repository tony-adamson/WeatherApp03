//
//  CityItemView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct CityItemView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Mumbai")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Text("22°C")
                    .font(.custom("UbuntuCondensed-Regular", size: 18))
                    .foregroundStyle(.greyWeather)
                Text("Light Drizzle")
                    .font(.custom("UbuntuCondensed-Regular", size: 12))
                    .foregroundStyle(.greyWeather)
            }
            
            Spacer()
            
            Image(systemName: "cloud.drizzle")
                .font(.custom("UbuntuCondensed-Regular", size: 40))
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    CityItemView()
}
