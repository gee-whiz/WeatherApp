//
//  DailyView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct DailyView: View {
    
    var forecastWeather: [DailyForecastViewModel]
    @State private var text: String = ""
    @State private var selectedForecast: DailyForecastViewModel? = nil
    
    var body: some View {
        LazyVStack {
            ForEach(forecastWeather, id: \.id) {  forecast in
                HStack {
                    Text( String(forecast.day))
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.primary)
                    Spacer()
                    Text(String(forecast.minTemp))
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    ProgressView(value: forecast.sliderPosition, total: 100)
                        .frame(width: 40).tint(Color.blue)
                    Text(String(forecast.maxTemp))
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    WebImageView(urlString: forecast.iconUrl)
                }.padding(16)
                    .onTapGesture {
                        self.selectedForecast = forecast
                    }
                Divider()
            }.sheet(item: $selectedForecast) { forecast in
                WeatheDetailView(forecastWeather: forecast)
            }
        }
    }
}


