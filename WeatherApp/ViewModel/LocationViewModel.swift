//
//  LocationViewModel.swift
//  WeatherApp
//
//  Created by George Kapoya on 4.2.2023.
//

import Foundation

class LocationViewModel {
    private var location: Location
    let id = UUID()
    init(location: Location) {
        self.location = location
    }
    var name: String {
        return location.name
    }
    var latitude: Double {
        return location.lat
    }
    var longitude: Double {
        return location.lon
    }
    var localTime: String {
        let date = Date.dateFromEpoch(dateEpoch: location.localtime)
        let humanReadableDate = date.humanReadableDate()
        return humanReadableDate
    }
}
