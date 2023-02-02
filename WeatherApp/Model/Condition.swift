//
//  Condition.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import Foundation

struct Condition: Decodable {
    let text: String
    let icon: String
    let code: Int
}
