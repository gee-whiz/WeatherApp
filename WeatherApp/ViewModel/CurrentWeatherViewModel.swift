//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import Foundation

class CurrentWeatherViewModel {

    private var currentWeather: CurrentWeather

    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    var tempreture: String {
        return "\(String(format: "%.0f", currentWeather.tempC))°C"
    }
    var condition: String {
        return String(currentWeather.condition.text)
    }
    var iconUrl: String {
        return "https:\(String(currentWeather.condition.icon))"
    }
    var windMph: String {
        return  "\(String(format: "%.0f", currentWeather.windMph))m/s"
    }
    var humidity: String {
        return "\(String(currentWeather.humidity))%"
    }
    var precipitation: String {
        return "\(String(format: "%.0f", currentWeather.precip))"
    }
}
