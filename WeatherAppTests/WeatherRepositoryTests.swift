//
//  WeatherRepositoryTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 3.2.2023.
//

import XCTest
@testable import WeatherApp

final class WeatherRepositoryTests: XCTestCase {

    func testFetchForecastWithValidLocation() {
        let repository = WeatherRepository()
        let location = "London,UK"
        let expectation = self.expectation(description: "Forecast fetched successfully")

        repository.fetchForecast(location: location) { result in
            switch result {
            case .success(let weather):
                XCTAssertNotNil(weather)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Fetch forecast failed with error: \(error)")
            }
        }

        waitForExpectations(timeout: 10.0, handler: nil)
    }

}
