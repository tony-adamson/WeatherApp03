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
    @StateObject var citySelectVM: CitySelectViewModel
    
    @State private var showFavoritePrompt = false
    @State private var selectedCity: Cities?
    @State private var search: String = ""
    @State private var navigateToNextScreen = false

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
                Image(systemName: "magnifyingglass")
                TextField("Search for a city", text: $search)
                    .autocorrectionDisabled()
                    .onChange(of: search) {
                        print(search)
                        citySelectVM.searchCities(with: search)
                        print(citySelectVM.filteredCities)
                    }
            }
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.top)
            
            Spacer()
            
            List(citySelectVM.filteredCities, id: \.id) { city in
                Text(city.name)
                    .padding()
                    .foregroundColor(.black)
                    .onTapGesture {
                        prepareAndNavigate(city: city)
                    }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
            navigationDestination(for: String.self) { _ in
                SelectorView()
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .alert(isPresented: $showFavoritePrompt) {
            Alert(
                title: Text("Set as Favorite"),
                message: Text("Would you like to set \(selectedCity?.name ?? "this city") as your favorite?"),
                primaryButton: .default(Text("Yes"), action: {
                    saveCityAsFavorite(city: selectedCity, isFavorite: true)
                }),
                secondaryButton: .cancel(Text("No"), action: {
                    saveCityAsFavorite(city: selectedCity, isFavorite: false)
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
    
    func prepareAndNavigate(city: Cities) {
        selectedCity = city
        if appSettings.isFirstLaunch {
            saveCityAsFavorite(city: city, isFavorite: true)
            appSettings.isFirstLaunch = false
            navigateToNextScreen = true
        } else {
            showFavoritePrompt = true
        }
    }
    
    func saveCityAsFavorite(city: Cities?, isFavorite: Bool) {
        guard let city = city else { return }
        citySelectVM.saveLocationAsFavorite(
            isFavorite: isFavorite,
            latitude: Double(city.latitude) ?? 0,
            longitude: Double(city.longitude) ?? 0,
            cityName: city.name)
        if !showFavoritePrompt {
            navigateToNextScreen = true
        }
    }
}

struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.primary)
            .font(.custom("UbuntuCondensed-Regular", size: 18))
    }
}

#Preview {
    CitySelectView(
        citySelectVM: CitySelectViewModel(
            cities: [
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
            ]
        ),
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
