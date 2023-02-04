//
//  WeatherRepositoryMock.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 3.2.2023.
//

import Foundation
@testable import WeatherApp

class WeatherRepositoryMock: WeatherRepositoryProtocol {
    var weatherResult: Result<Weather, Error>!
    var fetchForecastLocation: String?
    func fetchForecast(location: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        fetchForecastLocation = location
        completion(weatherResult)
    }
}
