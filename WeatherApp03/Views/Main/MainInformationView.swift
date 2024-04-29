//
//  MainInformationView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct MainInformationView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    var body: some View {
        VStack(spacing: 50) {
            // Date and temperature
            VStack {
                // Date now
                Text("\(Date.dateString(from: weatherVM.weatherDetail!.current.dt))")
                
                // Actual temperature now
                HStack(alignment: .bottom, spacing: 0) {
                    Text("\(weatherVM.weatherDetail!.current.temp, specifier: "%.1f")")
                        .font(.custom("UbuntuCondensed-Regular", size: 96))
                    Text("°C")
                        .font(.custom("UbuntuCondensed-Regular", size: 36))
                        .padding(.bottom, 12)
                }
                .foregroundStyle(.black)
                VStack {
                    HStack(spacing: 20) {
                        // Feels like temperature
                        Label("Feels like: \(weatherVM.weatherDetail!.current.feels_like, specifier: "%.1f")°C", systemImage: "thermometer.variable.and.figure")
                        
                        // Humidity
                        Label("Humidity: \(weatherVM.weatherDetail!.current.humidity) %", systemImage: "humidity")
                    }
                }
            }
            
            // Weather block
            VStack {
                // Weather icon
                Image(systemName: "\(weatherVM.weatherDetail!.current.weatherIconName)")
                    .font(.custom("UbuntuCondensed-Regular", size: 128))
                    .foregroundStyle(.black)
                
                // Weather name
                Text("\(weatherVM.weatherDetail!.current.weather[0].description.capitalized)")
                    .padding(.top, 20)
            }
            
            // Sunrise and sunset
            HStack {
                //  Sunrise time today
                Image(systemName: "sunrise")
                Text("\(Date.timeString(from: weatherVM.weatherDetail!.current.sunset))")
                    .padding(.trailing, 30)
                
                // Sunset time today
                Image(systemName: "sunset")
                Text("\(Date.timeString(from: weatherVM.weatherDetail!.current.sunrise))")
            }
            
            Spacer()
        }
        .foregroundStyle(.greyWeather)
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 90)
    }
}

struct MainInformationView_Previews: PreviewProvider {
    static var previews: some View {
        // Экземпляр WeatherVM с шаблонными данными
        let weatherVM = WeatherVM(weatherDetail: weatherModelTempale, context: PersistenceController.preview.container.viewContext)
        
        return MainInformationView()
            .environmentObject(weatherVM)
    }
}
