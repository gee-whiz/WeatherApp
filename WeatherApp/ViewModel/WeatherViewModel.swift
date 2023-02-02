//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation
import CoreLocation
import CoreLocationUI

class WeatherViewModel: ObservableObject {
    
    @Published var currentWeather: CurrentWeather?
    @Published var location: Location?
    @Published var todayWeather: [HourlyWeather] = []
    @Published var forecastWeather: DailyWeather?
    
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.weatherRepository = weatherRepository
        self.getWeather(location: "Helsinki")
    }
    
    func getWeather(location: String) {
        Task {
            await MainActor.run {
                weatherRepository.fetchForecast(location: location) { [weak self] (result) in
                    switch result {
                    case .success(let weatherData):
                        self?.processWeatherData(weatherData)
                    case .failure(let error):
                        print("Failed to fetch weather data: \(error)")
                    }
                }
            }
        }
    }
    
    private func processWeatherData(_ weather: Weather) {
        Task { @MainActor in
            currentWeather = weather.current
            todayWeather = weather.forecast.forecastday[0].hour.filter {
                $0.isDay == 0
            }
            forecastWeather = weather.forecast.forecastday[0].day
            location = weather.location
           }
    
    }
}
