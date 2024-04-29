//
//  OnboardingView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            Text("Добро пожаловать!")
                .font(.custom("UbuntuCondensed-Regular", size: 36))
                .padding(.top, 80)
            
            VStack(spacing: 50) {
                Text("Хотите выбрать Ваш город самостоятельно?")
                    .foregroundStyle(.greyWeather)
                
                NavigationLink {
                    CountrySelectView()
                } label: {
                    Text("Самостоятельно")
                        .foregroundStyle(.blue.opacity(0.7))
                }
                .padding(.top, 80)
                
                NavigationLink {
                    AutoLocationView()
                } label: {
                    Text("Автоматически")
                        .foregroundStyle(.green.opacity(0.7))
                }
            }
            .padding(.top, 50)
            .font(.custom("UbuntuCondensed-Regular", size: 18))
            .foregroundStyle(.black)
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
