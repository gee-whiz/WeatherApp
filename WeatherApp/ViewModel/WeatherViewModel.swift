//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation
import CoreLocation
import SwiftUI

/* The WeatherViewModel class is the main entry point for displaying weather information in the app.
This class acts as a bridge between the WeatherRepository and the Views.
 It is responsible for managing the state of the weather data, location, and error messages.
 */

class WeatherViewModel: NSObject, ObservableObject {

    @Published var currentWeather: CurrentWeatherViewModel?
    @Published var location: LocationViewModel?
    @Published var todayWeather: [HourlyViewModel] = []
    @Published var forecastWeather = [DailyForecastViewModel]()
    @Published var errorMessage: String = ""
    @Published var viewState: ViewState = .initial

    private let weatherRepository: WeatherRepositoryProtocol
    private let locationManager = LocationManager()

    init(weatherRepository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.weatherRepository = weatherRepository
        super.init()
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    /* Method to get the weather for the given coordinates.
     - Parameter coordinates: The coordinates of the location for which to get the weather.
     */
    func getWeather(_ coordinates: CLLocationCoordinate2D) async {
        let location = "\(coordinates.latitude),\(coordinates.longitude)"
        weatherRepository.fetchForecast(location: location) { [weak self] (result) in
            switch result {
            case .success(let weatherData):
                self?.processWeatherData(weatherData)
            case .failure(let error):
                self?.processErrorState(error)
            }
        }
    }

    private func processWeatherData(_ weather: Weather) {
        Task { @MainActor in
            currentWeather = CurrentWeatherViewModel(currentWeather: weather.current)
            errorMessage = ""
            self.viewState = .loaded
            let today =  weather.forecast.forecastday[0].hour.filter {
                $0.isDay == 0
            }
            todayWeather = today.map(HourlyViewModel.init)
            forecastWeather = weather.forecast.forecastday.map(DailyForecastViewModel.init)
            location = LocationViewModel.init(location: weather.location)
        }
    }

    private func processErrorState(_  error: Error) {
        Task { @MainActor in
            self.errorMessage = fetchWeatherError
            self.viewState = .failure
        }
    }
}

extension WeatherViewModel: LocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        Task { await self.getWeather(currentLocation.coordinate) }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMessage = updateLocationError
        self.viewState = .failure
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        manager.startUpdatingLocation()
    }
}
