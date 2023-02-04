//
//  Current.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct CurrentWeather: Decodable {
    let tempC: Double
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let humidity: Int
    let precip: Double
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case precip = "precip_mm"
        case humidity
    }
}
