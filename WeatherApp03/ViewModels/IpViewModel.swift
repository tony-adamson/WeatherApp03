//
//  IpViewModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 27.04.2024.
//

import Foundation
import Alamofire
import Combine

class IpViewModel {
    var cancellables = Set<AnyCancellable>()
    
    func fetchIpAdress() -> AnyPublisher<String, AFError> {
        let urlString = "https://api.ipify.org/?format=json"
        return AF.request(urlString)
            .publishDecodable(type: IpAdress.self)
            .value()
            .map { $0.ip }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
