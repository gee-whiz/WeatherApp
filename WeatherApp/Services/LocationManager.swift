//
//  LocationManager.swift
//  WeatherApp
//
//  Created by George Kapoya on 4.2.2023.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    weak var delegate: LocationManagerDelegate?
    private let locationManager = CLLocationManager()
    func requestLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.locationManager(manager, didUpdateLocations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationManager(manager, didFailWithError: error)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.locationManager(manager, didChangeAuthorization: status)
    }
}
