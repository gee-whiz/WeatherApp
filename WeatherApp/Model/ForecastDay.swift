//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct ForecastDay: Decodable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case hour
    }
}

struct Forecast: Decodable {
    let forecastday: [ForecastDay]
}
