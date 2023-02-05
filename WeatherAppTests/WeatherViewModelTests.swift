//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 3.2.2023.
//

import XCTest
import CoreLocation
import MapKit
import SwiftUI
@testable import WeatherApp

final class WeatherViewModelTests: XCTestCase {
    var sut: WeatherViewModel!
    var weatherRepositoryMock: WeatherRepositoryMock!
    override func setUp() {
        super.setUp()
        weatherRepositoryMock = WeatherRepositoryMock()
        sut = WeatherViewModel(weatherRepository: weatherRepositoryMock)
    }
    override func tearDown() {
        weatherRepositoryMock = nil
        sut = nil
        super.tearDown()
    }
    func testGetWeather() async {
       
        let weatherData: Weather

        if let data = testWeatherData.data(using: .utf8) {
            do {
                weatherData = try JSONDecoder().decode(Weather.self, from: data)
                weatherRepositoryMock.weatherResult = .success(weatherData)
                let coordinates = CLLocationCoordinate2D(latitude: 37.3352, longitude: -122.0307)
                await sut.getWeather(coordinates)
                XCTAssertEqual(weatherRepositoryMock.fetchForecastLocation, "37.3352,-122.0307")
                XCTAssertEqual(sut.todayWeather.count, 0)
            } catch {
              XCTFail("Error decoding weather data: \(error)")
            }
        } else {
            XCTFail("Error converting testWeatherData to Data")
        }


      
    }
}

