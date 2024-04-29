//
//  Convertation.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation

extension Date {
    static func dateString(from unixTime: TimeInterval, withFormat format: String = "EEEE, d MMMM, yyyy") -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_EN")
        return dateFormatter.string(from: date)
    }
    
    static func dateStringSmall(from unixTime: TimeInterval, withFormat format: String = "d MMM") -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_EN")
        return dateFormatter.string(from: date)
    }
    
    static func timeString(from unixTime: TimeInterval) -> String {
        dateString(from: unixTime, withFormat: "HH:mm")
    }
}
