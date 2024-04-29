//
//  Extensions.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation

extension CurrentWeather {
    var weatherIconName: String {
        switch weather.first!.main.lowercased() {
        case "thunderstorm":
            return "cloud.bolt.rain"
        case "drizzle":
            return "cloud.drizzle"
        case "rain":
            return "cloud.rain"
        case "snow":
            return "snow"
        case "mist", "smoke", "haze", "dust", "sand", "ash":
            return "cloud.fog"
        case "squall":
            return "wind"
        case "tornado":
            return "tornado"
        case "clear":
            return "sun.max"
        case "clouds":
            return "cloud"
        default:
            return "questionmark.circle"
        }
    }
}

extension HourlyWeather {
    var weatherIconName: String {
        switch weather.first!.main.lowercased() {
        case "thunderstorm":
            return "cloud.bolt.rain"
        case "drizzle":
            return "cloud.drizzle"
        case "rain":
            return "cloud.rain"
        case "snow":
            return "snow"
        case "mist", "smoke", "haze", "dust", "sand", "ash":
            return "cloud.fog"
        case "squall":
            return "wind"
        case "tornado":
            return "tornado"
        case "clear":
            return "sun.max"
        case "clouds":
            return "cloud"
        default:
            return "questionmark.circle"
        }
    }
}

extension DailyWeather {
    var weatherIconName: String {
        switch weather.first!.main.lowercased() {
        case "thunderstorm":
            return "cloud.bolt.rain"
        case "drizzle":
            return "cloud.drizzle"
        case "rain":
            return "cloud.rain"
        case "snow":
            return "snow"
        case "mist", "smoke", "haze", "dust", "sand", "ash":
            return "cloud.fog"
        case "squall":
            return "wind"
        case "tornado":
            return "tornado"
        case "clear":
            return "sun.max"
        case "clouds":
            return "cloud"
        default:
            return "questionmark.circle"
        }
    }
}
