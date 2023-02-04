//
//  CurrentWeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 3.2.2023.
//

import XCTest
@testable import WeatherApp

final class CurrentWeatherViewModelTests: XCTestCase {

    
    var currentWeather: CurrentWeather!
    var sut: CurrentWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        currentWeather = CurrentWeather(tempC: 23, isDay: 0, condition: Condition(text: "Sunny", icon: "icon.png", code: 2), windMph: 12, humidity: 90, precip: 0)
        sut = CurrentWeatherViewModel(currentWeather: currentWeather)
    }
    
    func test_temperature_returnsCorrectValue() {
        XCTAssertEqual(sut.tempreture, "23°C")
    }
    
    func test_condition_returnsCorrectValue() {
        XCTAssertEqual(sut.condition, "Sunny")
    }
    
    func test_iconUrl_returnsCorrectValue() {
        XCTAssertEqual(sut.iconUrl, "https:icon.png")
    }
    
    func test_windMph_returnsCorrectValue() {
        XCTAssertEqual(sut.windMph, "12m/s")
    }
    
    func test_humidity_returnsCorrectValue() {
        XCTAssertEqual(sut.humidity, "90%")
    }
    
    func test_precipitation_returnsCorrectValue() {
        XCTAssertEqual(sut.precipitation, "0")
    }

}
