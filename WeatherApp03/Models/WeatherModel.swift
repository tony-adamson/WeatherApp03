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
    var dt: TimeInterval
    var sunrise: TimeInterval
    var sunset: TimeInterval
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
    var wind_gust: Double?
}

struct BMWeather: Codable {
    var id: Int
    var main: String //"Clear",
    var description: String //"clear sky",
    var icon: String //"01d"
}

struct HourlyWeather: Codable {
    var dt: TimeInterval
    var temp: Double
    var weather: [BMWeather]
}

struct DailyWeather: Codable {
    var dt: TimeInterval
    var temp: DailyTemperature
    var weather: [BMWeather]
}

struct DailyTemperature: Codable {
    var min: Double
    var max: Double
}
    
let weatherModelTempale: WeatherModel = {
    
    let weather = BMWeather(id: 800, main: "Clear", description: "clear sky", icon: "01d")
    
    let dailyTemp = DailyTemperature(min: 15.0, max: 25.0)
    
    let currentWeather = CurrentWeather(
        dt: 1684929490,
        sunrise: 1684926645,
        sunset: 1684977332,
        temp: 20,
        feels_like: 18,
        humidity: 55,
        weather: [weather],
        pressure: 1014,
        dew_point: 290.69,
        uvi: 0.16,
        clouds: 53,
        wind_speed: 3,
        wind_deg: 93
    )
    
    let hourlyWeather = HourlyWeather(
        dt: 1684926000,
        temp: 23,
        weather: [weather]
    )
    
    let dailyWeather = DailyWeather(
        dt: 1684951200,
        temp: dailyTemp,
        weather: [weather]
    )
    
    return WeatherModel(
        current: currentWeather,
        hourly: [hourlyWeather, hourlyWeather, hourlyWeather],
        daily: [dailyWeather, dailyWeather, dailyWeather]
    )
}()

