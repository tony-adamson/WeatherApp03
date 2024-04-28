//
//  ReverseGeocodingModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import Foundation

struct ApiResponse: Codable {
    var results: [ReverseGeocodingModel]
}

struct ReverseGeocodingModel: Codable {
    var name: String
    var country: String
    var fullName: String?
}

struct CountryDetailsResponse: Codable {
    let name: CountryName
}

struct CountryName: Codable {
    let common: String
}

