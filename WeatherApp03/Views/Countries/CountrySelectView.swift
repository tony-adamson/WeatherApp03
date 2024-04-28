//
//  CountrySelectView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 28.04.2024.
//

import SwiftUI

struct CountrySelectView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(CountriesAndCities.self) var countriesAndCities
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(countriesAndCities.countriesAndCities) { country in
                        Text(country.name)
                            .font(.custom("UbuntuCondensed-Regular", size: 18))
                            .foregroundStyle(.greyWeather)
                            .padding(.top, 10)
                    }
                }
            }
            .padding(30)
        }
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
                            Text("Back")
                                .font(.custom("UbuntuCondensed-Regular", size: 18))
                        }
                        .foregroundStyle(.greyWeather)
                    }
                )
            }
        }
    }
}

#Preview {
    CountrySelectView()
        .environment(CountriesAndCities())
}
