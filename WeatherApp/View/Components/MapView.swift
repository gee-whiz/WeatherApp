//
//  MapView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region: MKCoordinateRegion
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,interactionModes: .all, showsUserLocation: true)
                .frame(height: 200, alignment: .center)
        }
        .background(Color.accentColor)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 0)
    }
}
