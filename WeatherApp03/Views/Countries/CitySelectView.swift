//
//  CitySelectView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import SwiftUI
import _MapKit_SwiftUI

struct CitySelectView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var appSettings: AppSettings
    
    @StateObject var viewModel = ChooseCityManuallyVM()
    
    @State private var showFavoritePrompt = false
    @State private var selectedCity: Cities?
    
//    @State private var position = MapCameraPosition.region(MKCoo)
    
    var citiesArray: [Cities]
    var countryName: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Your country: \(countryName)")
                    .foregroundStyle(.greyWeather)
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            HStack {
                Text("Select your city:")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                Spacer()
            }
            .padding(.top)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(citiesArray) { city in
                        NavigationLink {
                            SelectorView()
                        } label: {
                            Button(
                                action: {
                                    selectedCity = city
                                    if appSettings.isFirstLaunch {
                                        viewModel.saveManuallyLocationAsFavorite(
                                            name: city.name,
                                            latitude: Double(city.latitude)!,
                                            longitude: Double(city.longitude)!,
                                            isFavorite: true
                                        )
                                        appSettings.completeOnboarding()
                                        dismiss()
                                    } else {
                                        showFavoritePrompt = true
                                    }
                                },
                                label: {
                                    Text("\(city.name)")
                                        .font(.custom("UbuntuCondensed-Regular", size: 18))
                                        .foregroundStyle(.greyWeather)
                                        .padding(.top, 10)
                            })
                        }

                        
                    }
                }
            }
        }
        .alert(isPresented: $showFavoritePrompt) {
            Alert(
                title: Text("Set as Favorite"),
                message: Text("Would you like to set \(selectedCity?.name ?? "this city") as your favorite?"),
                primaryButton: .default(Text("Yes"), action: {
                    if let city = selectedCity {
                        viewModel.saveManuallyLocationAsFavorite(
                            name: city.name,
                            latitude: Double(city.latitude)!,
                            longitude: Double(city.longitude)!,
                            isFavorite: true
                        )
                    }
                    dismiss()
                }),
                secondaryButton: .cancel(Text("No"), action: {
                    if let city = selectedCity {
                        viewModel.saveManuallyLocationAsFavorite(
                            name: city.name,
                            latitude: Double(city.latitude)!,
                            longitude: Double(city.longitude)!,
                            isFavorite: false
                        )
                    }
                    dismiss()
                })
            )
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
    CitySelectView(
        citiesArray: [
                Cities(
                    id: 5,
                    name: "Kabul",
                    latitude: "55.001",
                    longitude: "55.001"
                ),
                Cities(
                    id: 2,
                    name: "Kabul",
                    latitude: "55.001",
                    longitude: "55.001"
                ),
                Cities(
                    id: 6,
                    name: "Kabul",
                    latitude: "55.001",
                    longitude: "55.001"
                )
            ],
        countryName: "Afganistan"
    )
        .environment(CountriesAndCities())
}
