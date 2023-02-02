//
//  Day.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct DailyWeather: Decodable {
    let maxtempC: Double
    let mintempC: Double
    let maxwindMph: Double?
    let avghumidity: Double?
    let dailyChanceOfRain: Int?
    let condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case maxwindMph = "maxwind_mph"
        case avghumidity = "avghumidity"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case condition = "condition"
    }
}
