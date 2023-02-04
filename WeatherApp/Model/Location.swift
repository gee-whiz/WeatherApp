//
//  Location.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let localtime: Int
    enum CodingKeys: String, CodingKey {
        case name
        case lat
        case lon
        case localtime =  "localtime_epoch"
    }
}
