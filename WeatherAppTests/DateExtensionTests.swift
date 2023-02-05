//
//  DateExtensionTests.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 5.2.2023.
//

import XCTest
@testable import WeatherApp

final class DateExtensionTests: XCTestCase {

    func testDateFromEpoch() {
        let epoch = 1609459200
        let expectedDate = Date(timeIntervalSince1970: TimeInterval(epoch))
        let resultDate = Date.dateFromEpoch(dateEpoch: epoch)
        
        XCTAssertEqual(resultDate, expectedDate)
    }
    
    func testHumanReadableDay() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.humanReadableDay()
        XCTAssertEqual(result, "Thursday")
    }
    
    func testHumanReadableDate() {
        let date = Date(timeIntervalSince1970: 0)
        let result = date.humanReadableDate()
        XCTAssertEqual(result, "01, Jan, Thursday")
    }
}
