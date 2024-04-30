//
//  LocationSearchViewModel.swift
//  WeatherApp03
//
//  Created by Антон Адамсон on 30.04.2024.
//

import MapKit
import Combine

class LocationSearchViewModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchQuery = ""
    @Published var searchResults = [MKLocalSearchCompletion]()
    private var searchCompleter: MKLocalSearchCompleter
    private var cancellables = Set<AnyCancellable>()

    override init() {
        self.searchCompleter = MKLocalSearchCompleter()
        super.init()
        self.searchCompleter.delegate = self

        $searchQuery
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main) // Уменьшает количество запросов
            .sink { [weak self] in
                self?.searchCompleter.queryFragment = $0
            }
            .store(in: &cancellables)
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.searchResults = completer.results
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    func getPlaceDetails(for completionMKLSC: MKLocalSearchCompletion, completion: @escaping (Result<Coordinates, Error>) -> Void) {
        let searchRequest = MKLocalSearch.Request(completion: completionMKLSC)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            if let error = error {
                completion(.failure(error)) // Ошибка сети или запроса
                return
            }
            guard let placemark = response?.mapItems.first?.placemark else {
                completion(.failure(NSError(domain: "com.yourdomain.app", code: 404, userInfo: [NSLocalizedDescriptionKey: "Location not found"])))
                return
            }
            let coordinates = Coordinates(latitude: placemark.coordinate.latitude, longitude: placemark.coordinate.longitude)
            completion(.success(coordinates)) // Успешное получение координат
        }
    }

}

