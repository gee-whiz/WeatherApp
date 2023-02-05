//
//  Hour.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct HourlyWeather: Decodable {
    let timeEpoch: Int
    let time: String
    let tempC: Double
    let isDay: Int
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
    }
}
