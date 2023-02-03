//
//  HourlyViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

class HourlyViewModel {
    
    private var weather: HourlyWeather
    
    let id = UUID()
    
    init(weather: HourlyWeather) {
        self.weather = weather
    }

    
    var tempreture: String {
        return "\(String(weather.tempC))°"
    }
    
    
    var time: String {
        let date = Date.dateFromEpoch(dateEpoch: weather.timeEpoch)
        let humanReadableHour = date.humanReadableHour()
        return String(humanReadableHour)
    }
 
    var iconUrl: String {
        return "https:\(String(weather.condition.icon))"
    }
}
