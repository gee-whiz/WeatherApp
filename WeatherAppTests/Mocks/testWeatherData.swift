//
//  testWeatherData.swift
//  WeatherAppTests
//
//  Created by George Kapoya on 5.2.2023.
//

import Foundation

let testWeatherData = """
{
    "location": {
        "name": "Helsinki",
        "lat": 2,
        "lon": 3,
        "localtime_epoch": 677,


    },
    "current": {
        "temp_c": 14,
        "is_day": 0,
        "condition": {
            "text": "",
            "icon": "",
            "code": 0
        },
        "wind_mph": 2,
        "humidity": 4,
        "precip_mm": 5
    },
    "forecast": {
        "forecastday": [
            {
                "date": "",
                "date_epoch": 233,
                "day": {
                    "maxtemp_c": 4,
                    "mintemp_c": 5,
                    "maxwind_mph": 4,
                    "avghumidity": 3,
                    "daily_chance_of_rain": 3,
                    "avgtemp": 4,
                    "condition": {
                        "text": "",
                        "icon": "",
                        "code": 2
                    }
                },
                "hour": [
                    {
                        "time_epoch": 2,
                        "time": "",
                        "temp_c": 3,
                        "is_day": 3,
                        "condition": {
                            "text": "",
                            "icon": "",
                            "code": 2
                        }
                    }
                ]
            }
        ]
    }
}
"""
