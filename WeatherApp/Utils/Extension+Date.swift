//
//  Extension+Date.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import Foundation

extension Date {

    static func dateFromEpoch(dateEpoch: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(dateEpoch))
    }

    func humanReadableDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: self)

        if Calendar.current.isDateInToday(self) {
            return "today".localizedCapitalized
        } else {
            return day.localizedCapitalized
        }
    }

    func humanReadableDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMM, EEEE"
        let date = dateFormatter.string(from: self)
        return date.localizedCapitalized
    }

    func humanReadableHour() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "h a"
           let hour = dateFormatter.string(from: self)
           return hour
    }
}
