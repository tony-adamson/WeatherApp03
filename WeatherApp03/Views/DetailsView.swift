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
            DetailsParametrView()
            .padding(.top, 30)
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
        .padding(.top, 50)
        .background(.green.opacity(0.1))
    }
}

#Preview {
    DetailsView()
}
