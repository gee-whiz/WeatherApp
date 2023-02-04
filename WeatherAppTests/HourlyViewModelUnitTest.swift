//
//  HourlyViewModelUnitTest.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 3.2.2023.
//

import XCTest
@testable import WeatherApp

final class HourlyViewModelUnitTest: XCTestCase {

    func testHourlyViewModel() {
            let weather = HourlyWeather(
                timeEpoch: 1675296000, time: "10:00 PM",
                tempC: -3,
                isDay: 0,
                condition: Condition(text: "Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/119.png", code: 3)
            )
            let viewModel = HourlyViewModel(weather: weather)
            
            XCTAssertEqual(viewModel.tempreture, "-3.0°C")
            XCTAssertEqual(viewModel.time, "2 AM")
            XCTAssertEqual(viewModel.iconUrl, "https://cdn.weatherapi.com/weather/64x64/day/119.png")
        }

}
