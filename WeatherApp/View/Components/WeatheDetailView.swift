//
//  WeatheDetailView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct WeatheDetailView: View {
    
    var forecastWeather: DailyForecastViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            WebImageView(urlString: forecastWeather.iconUrl)
            
            HStack(alignment: .center) {
                
                Text(forecastWeather.minTemp)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                Text(" : ")
                Text(forecastWeather.maxTemp)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            
            Text(forecastWeather.day)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }.padding()
        Spacer()
    }
}


