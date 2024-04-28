//
//  AutoLocationView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct AutoLocationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var geoCoder = ReverseGeocoding()
    
    var body: some View {
        VStack {
            VStack {
                if let location = geoCoder.locationDetail {
                    VStack(spacing: 50) {
                        Text("Город определен верно?")
                            .font(.custom("UbuntuCondensed-Regular", size: 36))
                            .padding(.top, 10)
                        Text("Город: \(location.name)")
                            .font(.custom("UbuntuCondensed-Regular", size: 18))
                        Text("Страна: \(location.fullName ?? "Loading...")")
                            .font(.custom("UbuntuCondensed-Regular", size: 18))
                    }
                } else {
                    Spinner()
                    Text("Fetching location...")
                        .padding(.top, 50)
                        .font(.custom("UbuntuCondensed-Regular", size: 18))
                        .foregroundStyle(.greyWeather)
                }
            }
            
            HStack {
                NavigationLink {
                    AppView()
                } label: {
                    Button(action: {}, label: {
                        Text("Верно")
                    })
                }

                NavigationLink {
                    CountrySelectView()
                } label: {
                    Text("Не верно")
                        .foregroundStyle(.red.opacity(0.7))
                }

            }
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
    AutoLocationView()
}
