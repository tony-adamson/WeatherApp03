//
//  AppSettingsVM.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 29.04.2024.
//

import Foundation

class AppSettings: ObservableObject {
    @Published var isFirstLaunch: Bool

    init() {
        // Проверяем, существует ли ключ в UserDefaults. Если нет, то это действительно первый запуск.
        if UserDefaults.standard.object(forKey: "isFirstLaunch") == nil {
            // Устанавливаем true, так как это первый запуск.
            self.isFirstLaunch = true
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
        } else {
            // Загружаем сохранённое значение, так как это не первый запуск.
            self.isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        }
    }

    func completeOnboarding() {
        self.isFirstLaunch = false
        UserDefaults.standard.set(false, forKey: "isFirstLaunch")
    }
}

