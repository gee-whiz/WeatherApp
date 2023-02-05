//
//  DailyForecastViewModelTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 5.2.2023.
//

import XCTest
@testable import WeatherApp

final class DailyForecastViewModelTests: XCTestCase {

    func testDailyForecastViewModel() {
        let forecastWeather = ForecastDay(date: "",
                                          dateEpoch: 1675296000,
                                          day: DailyWeather(maxtempC: 3,
                                                            mintempC: 1,
                                                            maxwindMph: 0,
                                                            avghumidity: 0,
                                                            dailyChanceOfRain: 50,
                                                            avgtemp: 2,
                                                            condition: Condition(text: "cloudy",
                                                                                 icon: "icon",
                                                                                 code: 0)),
                                          hour: [HourlyWeather]())
        let viewModel = DailyForecastViewModel(forecastWeather: forecastWeather)
        XCTAssertEqual(viewModel.dailyChanceOfRain, "50%")
        XCTAssertEqual(viewModel.day, "Thursday")
        XCTAssertEqual(viewModel.iconUrl, "https:icon")
        XCTAssertEqual(viewModel.minTemp, "1°C")
        XCTAssertEqual(viewModel.maxTemp, "3°C")
        XCTAssertEqual(viewModel.avgTemp, "2°C")
        XCTAssertEqual(viewModel.humidity, "0%")
        XCTAssertEqual(viewModel.condition, "cloudy")
        XCTAssertEqual(viewModel.temperatureRange, 0.5)
    }
}
