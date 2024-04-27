//
//  SettingsView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            // Feedback block
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Feedback")
                        .font(.custom("UbuntuCondensed-Regular", size: 24))
                        .foregroundStyle(.black)
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("Report an Issue")
                    Text("Facing an issue? Report and we’ll look into it.")
                        .font(.custom("UbuntuCondensed-Regular", size: 12))
                }
                VStack(alignment: .leading) {
                    Text("Rate on App Store")
                    Text("Enjoying the app? Leave a review on the App Store.")
                        .font(.custom("UbuntuCondensed-Regular", size: 12))
                }
            }
            .foregroundStyle(.greyWeather)
            .padding(.top, 50)
            
            // About block
            VStack(alignment: .leading, spacing: 20) {
                Text("About")
                    .font(.custom("UbuntuCondensed-Regular", size: 24))
                    .foregroundStyle(.black)
                VStack(alignment: .leading) {
                    Text("About Weather")
                    Text("Read a bit more about the app.")
                        .font(.custom("UbuntuCondensed-Regular", size: 12))
                }
                VStack(alignment: .leading) {
                    Text("The Team")
                    Text("Get to know the team that made Weather a reality.")
                        .font(.custom("UbuntuCondensed-Regular", size: 12))
                }
            }
            .foregroundStyle(.greyWeather)
            .padding(.top, 50)
            
            Spacer()
        }
        .font(.custom("UbuntuCondensed-Regular", size: 18))
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
                            Text("Settings")
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
    SettingsView()
}
