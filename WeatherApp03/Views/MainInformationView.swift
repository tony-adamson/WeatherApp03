//
//  MainInformationView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct MainInformationView: View {
    var body: some View {
        VStack(spacing: 50) {
            // Date and temperature
            VStack {
                Text("Friday, 25 December 2024")
                HStack(alignment: .bottom, spacing: 0) {
                    Text("22")
                        .font(.custom("UbuntuCondensed-Regular", size: 96))
                    Text("\u{2103}")
                        .font(.custom("UbuntuCondensed-Regular", size: 36))
                        .padding(.bottom, 12)
                }
                .foregroundStyle(.black)
                HStack {
                    Image(systemName: "arrow.down")
                    Text("16\u{2103}")
                    Image(systemName: "arrow.up")
                    Text("26\u{2103}")
                }
            }
            .background(.green.opacity(0.1))
            
            // Weather block
            VStack {
                Image(systemName: "cloud.drizzle")
                    .font(.custom("UbuntuCondensed-Regular", size: 128))
                    .foregroundStyle(.black)
                Text("Light Drizzle")
            }
            .background(.green.opacity(0.1))
            
            // Sunrise and sunset
            HStack {
                Image(systemName: "sunrise")
                Text("09:18 AM")
                    .padding(.trailing, 30)
                Image(systemName: "sunset")
                Text("06:32 PM")
            }
            .background(.green.opacity(0.1))
        }
        .foregroundStyle(.greyWeather)
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 80)
    }
}

#Preview {
    MainInformationView()
}
