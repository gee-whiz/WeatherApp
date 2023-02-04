//
//  DailyForecastViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import Foundation

class DailyForecastViewModel: Identifiable {
    private var forecastWeather: ForecastDay
    let id = UUID()
    init(forecastWeather: ForecastDay) {
        self.forecastWeather = forecastWeather
    }
    var dailyChanceOfRain: String {
        if let chanceOfRain = forecastWeather.day.dailyChanceOfRain {
            return "\(String(chanceOfRain))%"
        }
        return "-"
    }
    var day: String {
        let date = Date.dateFromEpoch(dateEpoch: forecastWeather.dateEpoch)
        let humanReadableDay = date.humanReadableDay()
        return humanReadableDay
    }
    var humidity: String {
        if let humidity = forecastWeather.day.avghumidity {
            return "\(String(format: "%.0f", humidity))%"
        }
        return "-"
    }
    var condition: String {
        if let text = forecastWeather.day.condition?.text {
            return "\(String(text))"
        }
        return "-"
    }
    var minTemp: String {
        return "\(String(format: "%.0f", forecastWeather.day.mintempC))°C"
    }
    var maxTemp: String {
        return "\(String(format: "%.0f", forecastWeather.day.maxtempC))°C"
    }
    var avgTemp: String {
        if let avg = forecastWeather.day.avgtemp {
            return "\(String(format: "%.0f", avg))°C"
        }
        return "-"
    }
    var sliderPosition: Double {
        return ((forecastWeather.day.avgtemp ?? 0) - forecastWeather.day.mintempC) /
        (forecastWeather.day.maxtempC - forecastWeather.day.mintempC)
    }
    var iconUrl: String {
        if let condition = forecastWeather.day.condition {
            return "https:\(String(condition.icon))"
        } else {
            return ""
        }
    }
}
