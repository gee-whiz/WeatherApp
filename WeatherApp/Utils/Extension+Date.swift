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
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: self)

        if Calendar.current.isDateInToday(self) {
            return "Today"
        } else {
            return day
        }
    }
    
    func humanReadableHour() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.locale = Locale(identifier: "en_US_POSIX")
           dateFormatter.dateFormat = "h a"
           let hour = dateFormatter.string(from: self)
           return hour
    }
}
