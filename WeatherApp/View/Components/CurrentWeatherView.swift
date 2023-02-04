//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct CurrentWeatherView: View {
    var currentWeather: CurrentWeatherViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(currentWeather.tempreture)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                Text(currentWeather.condition)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            WebImageView(urlString: currentWeather.iconUrl)
        }.padding()
    }
}
