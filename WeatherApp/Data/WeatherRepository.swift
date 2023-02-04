//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

/* `WeatherRepository` is a class that implements the `WeatherRepositoryProtocol` protocol
 to provide a way to fetch weather forecasts for a given location.
 */
class WeatherRepository: WeatherRepositoryProtocol {
    /* A function that fetches the weather forecasts for a given location.
        - Parameters:
          - location: The location for which to fetch the weather forecasts.
          - completion: A closure that will be called with the result of the fetch operation.
     */
    func fetchForecast(location: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        let webService = WebService()

        #if DEBUG
        let apiKey = debugApiKey
        #else
        let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
        #endif
    
        let queryString = "key=\(apiKey)&q=\(location)&days=5&aqi=no&alerts=no"
        webService.request(
            endpoint: baseUrl,
            method: "GET",
            query: queryString,
            completion: completion
        )
    }
}
