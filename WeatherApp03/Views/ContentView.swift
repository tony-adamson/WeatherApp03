//
//  ContentView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                // City row
                VStack(alignment: .leading) {
                    Text("Mumbai")
                        .font(.custom("UbuntuCondensed-Regular", size: 18))
                    Text("Current location")
                        .font(.custom("UbuntuCondensed-Regular", size: 10))
                        .foregroundStyle(.greyWeather)
                }
                Spacer()
                Image(systemName: "map")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .foregroundStyle(.greyWeather)
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .foregroundStyle(.greyWeather)
            }
            .background(.green.opacity(0.1))
            
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
        .padding(30)
    }
}

#Preview {
    ContentView()
}
