//
//  MapView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI
import MapKit

struct MapView: View {

    @State var location: LocationViewModel
    @State var currentWeather: CurrentWeatherViewModel
    @State var region = MKCoordinateRegion(center: .init(),
                                           span: MKCoordinateSpan(latitudeDelta: 0.5,
                                                                  longitudeDelta: 0.5))
    @State private var locations = [TemperatureAnnotation]()

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all,
                showsUserLocation: true, annotationItems: locations) { anotation in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: anotation.latitude,
                                                                 longitude: anotation.longitude)) {
                    ZStack {
                        Circle()
                             .fill(Color.accentColor)
                             .frame(width: 50, height: 50)
                             .overlay(Circle().stroke(Color.white, lineWidth: 2))
                         Text(anotation.temperature)
                             .foregroundColor(.white)
                    }
                }
            }.frame(height: 200, alignment: .center).padding(4)
        }
        .onAppear {
            region.center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let newLocation = TemperatureAnnotation(temperature: currentWeather.tempreture,
                                                    latitude: region.center.latitude,
                                                    longitude: region.center.longitude)
            locations.append(newLocation)
        }
        .background(Color.accentColor)
                .cornerRadius(8)
                .shadow(color: Color.accentColor, radius: 2, x: 0, y: 0)
    }
}

struct TemperatureAnnotation: Identifiable {
    let id = UUID()
    let temperature: String
    let latitude: Double
    let longitude: Double
}
