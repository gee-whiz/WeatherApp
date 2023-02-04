//
//  WeatherService.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

/* WebService class is a implementation of the WebServiceProtocol.
 It makes a request to the API endpoint, decodes the JSON response, and returns the decoded data as Result<T,
 Error> in the completion block.
 */
final class WebService: WebServiceProtocol {
    /* Request method to make API requests
     - endpoint: API endpoint as a String
     - method: HTTP method as a String
     - query: optional query parameters as a String
     - completion: completion block with Result<T, Error> as the parameter
     */
    func request<T: Decodable>(
        endpoint: String,
        method: String,
        query: String?,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var urlString = endpoint
        if let query = query {
            urlString += "?" + query
        }
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            // Check for network errors
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "WebService", code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "No data received."])
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
