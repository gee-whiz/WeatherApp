//
//  Weather.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct Weather: Decodable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}
