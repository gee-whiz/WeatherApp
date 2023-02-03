//
//  DailyForecastViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import Foundation


class DailyForecastViewModel {
    
    private var forecastWeather: ForecastDay
    
    let id = UUID()
    
    init(forecastWeather: ForecastDay) {
        self.forecastWeather = forecastWeather
    }
    
    
    var day: String {
        let date = Date.dateFromEpoch(dateEpoch: forecastWeather.dateEpoch)
        let humanReadableDay = date.humanReadableDay()
        return humanReadableDay
    }
    
    var minTemp: String {
        return "\(String(forecastWeather.day.mintempC))°"
    }
    
    var maxTemp: String {
        return "\(String(forecastWeather.day.maxtempC))°"
    }
    
    var sliderPosition: Double {
        return ((forecastWeather.day.avgtemp ?? 0) - forecastWeather.day.mintempC) / (forecastWeather.day.maxtempC - forecastWeather.day.mintempC)
    }
    
    var iconUrl: String {
        if let condition = forecastWeather.day.condition {
            return "https:\(String(condition.icon))"
        } else {
            return ""
        }
       
    }
    
}

