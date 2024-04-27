//
//  DetailsView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 26.04.2024.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Details")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            VStack(spacing: 20) {
                DetailsParametrView()
                DetailsParametrView()
                DetailsParametrView()
                DetailsParametrView()
                DetailsParametrView()
                DetailsParametrView()
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 50)
    }
}

#Preview {
    DetailsView()
}
