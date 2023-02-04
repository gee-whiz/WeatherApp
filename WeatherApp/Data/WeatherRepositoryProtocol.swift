//
//  WeatherRepositoryProtocol.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchForecast(
           location: String,
           completion: @escaping (Result<Weather, Error>) -> Void
       )
}
