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
                // Date now
                Text("Friday, 25 December 2024")
                
                // Actual temperature now
                HStack(alignment: .bottom, spacing: 0) {
                    Text("22")
                        .font(.custom("UbuntuCondensed-Regular", size: 96))
                    Text("\u{2103}")
                        .font(.custom("UbuntuCondensed-Regular", size: 36))
                        .padding(.bottom, 12)
                }
                .foregroundStyle(.black)
                HStack {
                    // Minimum temperature
                    Image(systemName: "arrow.down")
                    Text("16\u{2103}")
                    // Maximum temperature
                    Image(systemName: "arrow.up")
                    Text("26\u{2103}")
                }
            }
            .background(.green.opacity(0.1))
            
            // Weather block
            VStack {
                // Weather icon
                Image(systemName: "cloud.drizzle")
                    .font(.custom("UbuntuCondensed-Regular", size: 128))
                    .foregroundStyle(.black)
                
                // Weather name
                Text("Light Drizzle")
                    .padding(.top, 20)
            }
            .background(.green.opacity(0.1))
            
            // Sunrise and sunset
            HStack {
                //  Sunrise time today
                Image(systemName: "sunrise")
                Text("09:18 AM")
                    .padding(.trailing, 30)
                
                // Sunset time today
                Image(systemName: "sunset")
                Text("06:32 PM")
            }
            .background(.green.opacity(0.1))
            
            Spacer()
        }
        .foregroundStyle(.greyWeather)
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 90)
    }
}

#Preview {
    MainInformationView()
}
