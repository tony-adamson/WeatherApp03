//
//  DetailsView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Details")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            VStack(alignment: .leading, spacing: 20) {
                DetailsParametrView(
                    parametrName: "Pressure",
                    parametrCount: "\(weatherVM.weatherDetail!.current.pressure)",
                    parametrCh: "mm rt st")
                
                DetailsParametrView(
                    parametrName: "Dew Point",
                    parametrCount: "\(weatherVM.weatherDetail!.current.dew_point)",
                    parametrCh: "XXX")
                
                DetailsParametrView(
                    parametrName: "Uvi",
                    parametrCount: "\(weatherVM.weatherDetail!.current.uvi)",
                    parametrCh: "XXX")
                
                DetailsParametrView(
                    parametrName: "Clouds",
                    parametrCount: "\(weatherVM.weatherDetail!.current.clouds)",
                    parametrCh: "%")
                
                DetailsParametrView(
                    parametrName: "Wind Speed",
                    parametrCount: "\(weatherVM.weatherDetail!.current.wind_speed)",
                    parametrCh: "m/s")
                
                DetailsParametrView(
                    parametrName: "Wind Degrees",
                    parametrCount: "\(weatherVM.weatherDetail!.current.wind_deg)",
                    parametrCh: "degrees?")
                
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 50)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        // Экземпляр WeatherVM с шаблонными данными
        let weatherVM = WeatherVM(weatherDetail: weatherModelTempale, context: PersistenceController.preview.container.viewContext)
        
        return DetailsView()
            .environmentObject(weatherVM)
    }
}
