//
//  DetailsParametrView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct DetailsParametrView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Parameter name
            Text("Precipitation")
                .font(.custom("UbuntuCondensed-Regular", size: 12))
                .foregroundStyle(.greyWeather)
            
            // Parameter value
            Text("0.0mm")
                .font(.custom("UbuntuCondensed-Regular", size: 18))
        }
    }
}

#Preview {
    DetailsParametrView()
}
