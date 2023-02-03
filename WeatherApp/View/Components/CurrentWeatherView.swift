//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    var currentWeather: CurrentWeather
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("\(String(currentWeather.tempC))°")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                Text(String(currentWeather.condition.text))
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            AsyncImage(url: URL(string: "https:\(String(currentWeather.condition.icon))")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resized()
                default:
                    Image(systemName: "photo.circle")
                        .resized().foregroundColor(.gray)
                }
            }
        }.padding()
    }
}
