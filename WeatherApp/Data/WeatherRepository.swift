//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation


class WeatherRepository: WeatherRepositoryProtocol {
    
    func fetchForecast(location: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        let webService = WebService()

        #if DEBUG
        let apiKey = debugApiKey
        #else
        let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
        #endif
        
        let queryString = "key=\(apiKey)&q=\(location)&days=1&aqi=no&alerts=no"
        webService.request(
            endpoint: baseUrl,
            method: "GET",
            query: queryString,
            completion: completion
        )
    }
}
