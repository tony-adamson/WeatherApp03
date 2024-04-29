//
//  WeatherHeaderView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import SwiftUI

struct WeatherHeaderView: View {
    var city: City?
    
    var body: some View {
        VStack {
            HStack {
                // City row
                VStack(alignment: .leading) {
                    Text("\(city?.name ?? "Unknowed city")")
                        .font(.custom("UbuntuCondensed-Regular", size: 18))
                    Text("Current location")
                        .font(.custom("UbuntuCondensed-Regular", size: 10))
                        .foregroundStyle(.greyWeather)
                }
                Spacer()
                
                // Choose city
                NavigationLink(destination: {
                    ChooseCityView()
                }, label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundStyle(.greyWeather)
                })
                
                // App settings
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundStyle(.greyWeather)
                }
            }
        }
    }
}

#Preview {
    WeatherHeaderView()
}
