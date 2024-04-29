//
//  DetailsParametrView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct DetailsParametrView: View {
    var parametrName: String
    var parametrCount: String
    var parametrCh: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // Parameter name
            Text("\(parametrName)")
                .font(.custom("UbuntuCondensed-Regular", size: 12))
                .foregroundStyle(.greyWeather)
            
            // Parameter value
            Text("\(parametrCount) \(parametrCh)")
                .font(.custom("UbuntuCondensed-Regular", size: 18))
        }
    }
}

#Preview {
    DetailsParametrView(parametrName: "Precipitation", parametrCount: "10", parametrCh: "mm")
}
