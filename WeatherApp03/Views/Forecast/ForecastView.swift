//
//  ForecastView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            
            // ROW 1 with horizontal scroll
            VStack(alignment: .leading) {
                Text("Hourly Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 18))
                    .foregroundStyle(.greyWeather)
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        ForEach(weatherVM.weatherDetail!.hourly, id: \.dt) { item in
                            HourlyForecastItem(
                                timeOfWeather: "\(Date.timeString(from: item.dt))",
                                iconName: "\(item.weatherIconName)"
                            )
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 20)
            }
            .padding(.top, 50)
            
            // ROW 2 with horizontal scroll
            VStack(alignment: .leading) {
                Text("Daily Forecast")
                    .font(.custom("UbuntuCondensed-Regular", size: 18))
                    .foregroundStyle(.greyWeather)
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        ForEach(weatherVM.weatherDetail!.daily, id: \.dt) { item in
                            DailyForecastItem(
                                date: "\(Date.dateStringSmall(from: item.dt))",
                                minTemp: item.temp.min,
                                maxTemp: item.temp.max,
                                iconName: "\(item.weatherIconName)"
                            )
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 20)
            }
            .padding(.top, 50)
            
            Spacer()
            
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 50)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        // Экземпляр WeatherVM с шаблонными данными
        let weatherVM = WeatherVM(weatherDetail: weatherModelTempale, context: PersistenceController.preview.container.viewContext)
        
        return ForecastView()
            .environmentObject(weatherVM)
    }
}
