//
//  ChooseCityView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct ChooseCityView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 50) {
            CityItemView()
            
            CityItemView()
            
            CityItemView()
            
            Spacer()
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(
                    action: {
                        dismiss()
                    }, 
                    label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.custom("UbuntuCondensed-Regular", size: 12))
                            Text("Select City")
                                .font(.custom("UbuntuCondensed-Regular", size: 18))
                        }
                        .foregroundStyle(.greyWeather)
                    }
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {},
                    label: {
                        Image(systemName: "plus")
//                            .font(.custom("UbuntuCondensed-Regular", size: 18))
                            .foregroundStyle(.greyWeather)
                    }
                )
            }
        }
    }
}

#Preview {
    ChooseCityView()
}
