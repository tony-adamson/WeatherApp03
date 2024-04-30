//
//  CountrySelectView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 28.04.2024.
//

import SwiftUI
import MapKit

struct CountrySelectView: View {
    @Environment(\.dismiss) var dismiss
//    @Environment(CountriesAndCities.self) var countriesAndCities
    @StateObject private var viewModel = LocationSearchViewModel()
    
    var body: some View {
        VStack {
            List {
                TextField("Search", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if viewModel.searchResults.isEmpty {
                    Text("No results found")
                } else {
                    ForEach(viewModel.searchResults, id: \.self) { result in
                        NavigationLink {
                            SelectorView()
                        } label: {
                            Text(result.title)
                        }
                    }
                }
            }
//            HStack {
//                Text("Select your country:")
//                    .font(.custom("UbuntuCondensed-Regular", size: 24))
//                Spacer()
//            }
//            ScrollView {
//                LazyVStack {
//                    ForEach(countriesAndCities.countriesAndCities) { country in
//                        NavigationLink {
//                            CitySelectView(
//                                citiesArray: country.cities,
//                                countryName: country.name
//                            )
//                        } label: {
//                            Text(country.name)
//                                .font(.custom("UbuntuCondensed-Regular", size: 18))
//                                .foregroundStyle(.greyWeather)
//                                .padding(.top, 10)
//                        }
//                    }
//                }
//            }
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
//        .environment(CountriesAndCities())
}
