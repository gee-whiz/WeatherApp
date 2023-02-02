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
            parameters: [String: Any]?,
            completion: @escaping (Result<T, Error>) -> Void
        ) {
            // Build the URL
            let url = URL(string: endpoint)!

            // Configure the request
            var request = URLRequest(url: url)
            request.httpMethod = method
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            // Add parameters to the request body if needed
            if let parameters = parameters {
                request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
            }

            // Make the request
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
