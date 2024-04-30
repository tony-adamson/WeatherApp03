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
    
    @EnvironmentObject var appSettings: AppSettings
    @Environment(CountriesAndCities.self) var countriesAndCities
    
    @StateObject private var viewModel = LocationSearchViewModel()
    @StateObject private var saveCityModel = ChooseCityManuallyVM()
    
    @State private var showFavoritePrompt = false
    @State private var selectedCity: String?
    @State private var selectedCity2: CityMapKit?
    
    var body: some View {
        VStack {
            HStack {
                Text("Select your country:")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(countriesAndCities.countriesAndCities) { country in
                        NavigationLink {
                            CitySelectView(
                                citiesArray: country.cities,
                                countryName: country.name
                            )
                        } label: {
                            Text(country.name)
                                .font(.custom("UbuntuCondensed-Regular", size: 18))
                                .foregroundStyle(.greyWeather)
                                .padding(.top, 10)
                        }
                    }
                }
            }
            
//            List {
//                TextField("Search", text: $viewModel.searchQuery)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                if viewModel.searchResults.isEmpty {
//                    Text("No results found")
//                } else {
//                    ForEach(viewModel.searchResults, id: \.self) { city in
//                        NavigationLink {
//                            SelectorView()
//                        } label: {
//                            Button {
//                                selectedCity2 = CityMapKit(name: city.title)
//                                print(String(describing: selectedCity2?.name))
////                                viewModel.getPlaceDetails(for: city) { result in
////                                    switch result {
////                                    case .success(let coordinate):
////                                        print("Coordinates: \(coordinate)")
////                                        selectedCity2?.latitude = coordinate.latitude
////                                        selectedCity2?.longitude = coordinate.longitude
////                                    case .failure(let error):
////                                        print("Error: \(error.localizedDescription)")
////                                    }
////                                }
//                                
////                                if appSettings.isFirstLaunch {
////                                    saveCityModel.saveManuallyLocationAsFavorite(
////                                        name: (selectedCity2?.name)!,
////                                        latitude: (selectedCity2?.latitude)!,
////                                        longitude: (selectedCity2?.longitude)!,
////                                        isFavorite: true
////                                    )
////                                    appSettings.completeOnboarding()
////                                    dismiss()
////                                } else {
////                                    showFavoritePrompt = true
////                                }
//                            } label: {
//                                Text(city.title)
//                            }
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
        .environment(CountriesAndCities())
}
