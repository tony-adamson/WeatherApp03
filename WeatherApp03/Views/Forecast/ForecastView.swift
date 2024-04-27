//
//  ForecastView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            .background(.green.opacity(0.1))
            
            // ROW 1 with horizontal scroll
            VStack(alignment: .leading) {
                Text("Hourly Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 18))
                    .foregroundStyle(.greyWeather)
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                        HourlyForecastItem()
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 20)
            }
            .background(.green.opacity(0.1))
            .padding(.top, 50)
            
            // ROW 2 with horizontal scroll
            VStack(alignment: .leading) {
                Text("Daily Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 18))
                    .foregroundStyle(.greyWeather)
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                        DailyForecastItem()
                    }
                }
                .padding(.top, 20)
            }
            .background(.green.opacity(0.1))
            .padding(.top, 50)
            
            Spacer()
            
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 50)
    }
}

#Preview {
    ForecastView()
}
