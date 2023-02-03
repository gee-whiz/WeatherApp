//
//  WeatherService.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

final class WebService:  WeatherServiceProtocol {
    
    func request<T: Decodable>(
            endpoint: String,
            method: String,
            query:  String?,
            completion: @escaping (Result<T, Error>) -> Void
        ) {
            var urlString = endpoint
            if let query = query {
               urlString = urlString + "?" + query
            }
            let url = URL(string: urlString)!

            var request = URLRequest(url: url)
            request.httpMethod = method
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                // Check for network errors
                if let error = error {
                    completion(.failure(error))
                    return
                }

                // Check for data
                guard let data = data else {
                    let error = NSError(domain: "WebService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received."])
                    completion(.failure(error))
                    return
                }

                // Decode the data
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch let error {
                    completion(.failure(error))
                }
            }

            task.resume()
        }
    
}
