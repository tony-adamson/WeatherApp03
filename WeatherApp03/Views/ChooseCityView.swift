//
//  ChooseCityView.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import SwiftUI

struct ChooseCityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: City.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \City.name, ascending: true)],
        predicate: NSPredicate(format: "isFavorite == YES")
    ) var cities: FetchedResults<City>
    
    var body: some View {
        VStack(spacing: 50) {
            ForEach(cities, id: \.self) { city in
                CityItemView(city: city)
            }
            
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
                NavigationLink {
                    CountrySelectView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.greyWeather)
                }
            }
        }
    }
}

#Preview {
    ChooseCityView()
}
