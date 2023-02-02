//
//  WeatherServiceProtocol.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

protocol WeatherServiceProtocol {
    func request<T: Decodable>(
           endpoint: String,
           method: String,
           query: String?,
           completion: @escaping (Result<T, Error>) -> Void
       )
}
