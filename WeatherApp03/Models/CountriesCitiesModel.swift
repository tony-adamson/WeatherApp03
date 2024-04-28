//
//  CountriesCitiesModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 28.04.2024.
//

import Foundation

struct CountriesCitiesModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var iso2: String
    var cities: [Cities]
}

struct Cities: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var latitude: String
    var longitude: String
}
