//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var currentWeather: CurrentWeatherViewModel?
    @Published var location: Location?
    @Published var todayWeather: [HourlyViewModel] = []
    @Published var forecastWeather = [DailyForecastViewModel]()
    @Published var region: MKCoordinateRegion
    @Published var errorMesage: String?
    
    private let locationManager = CLLocationManager()
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.weatherRepository = weatherRepository
        self.region = MKCoordinateRegion(center: .init(), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        super.init()
        locationManager.delegate = self
        requestLocation()
    }
    
    private func getWeather(_ coordinates: CLLocationCoordinate2D) async {
        let location = "\(coordinates.latitude),\(coordinates.longitude)"
        weatherRepository.fetchForecast(location: location) { [weak self] (result) in
            switch result {
            case .success(let weatherData):
                self?.processWeatherData(weatherData)
            case .failure(let error):
                self?.errorMesage = "Failed to fetch weather data: \(error.localizedDescription)"
            }
        }
    }
    
    private func processWeatherData(_ weather: Weather) {
        Task { @MainActor in
            currentWeather = CurrentWeatherViewModel(currentWeather: weather.current)
            
            let today =  weather.forecast.forecastday[0].hour.filter {
                $0.isDay == 0
            }
            todayWeather = today.map(HourlyViewModel.init)
            forecastWeather = weather.forecast.forecastday.map(DailyForecastViewModel.init)
            location = weather.location
        }
    }
    
    private func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        region.center = currentLocation.coordinate
        Task { await self.getWeather(currentLocation.coordinate) }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMesage = "Failed to update location: \(error.localizedDescription)"
    }
    
}


