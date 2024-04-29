//
//  WeatherModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation

struct WeatherModel: Codable {
    var current: CurrentWeather
    var hourly: [HourlyWeather]
    var daily: [DailyWeather]
}

struct CurrentWeather: Codable {
    var dt: Date
    var sunrise: Date
    var sunset: Date
    var temp: Double
    var feels_like: Double
    var humidity: Int
    var weather: [BMWeather]
    
    // Additional parametrs
    var pressure: Int
    var dew_point: Double
    var uvi: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var wind_gust: Double
}

struct BMWeather: Codable {
    var id: Int
    var main: String //"Clear",
    var description: String //"clear sky",
    var icon: String //"01d"
}

struct HourlyWeather: Codable {
    var dt: Date
    var temp: Double
    var weather: [BMWeather]
}

struct DailyWeather: Codable {
    var dt: Date
    var temp: DailyTemperature
    var weather: [BMWeather]
}

struct DailyTemperature: Codable {
    var min: Double
    var max: Double
}
    
  

