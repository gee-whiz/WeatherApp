//
//  WeatheDetailView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct WeatheDetailView: View {
    var forecastWeather: DailyForecastViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                HStack {
                    Text(forecastWeather.day)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.primary)
                            .font(.title)
                    }
                }
                CircleGradient(gradient: LinearGradient(
                           gradient: Gradient(colors: [.white, .black]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
                ), title: forecastWeather.iconUrl)
                VStack(alignment: .center) {
                    Text(forecastWeather.avgTemp)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    Text(forecastWeather.condition) .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
                Divider()
                HStack {
                    VStack {
                        Text("humidity")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.humidity)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack {
                        Text("rain")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.dailyChanceOfRain)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                }
                Divider()
                HStack {
                    VStack {
                        Text("min")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.minTemp)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack {
                        Text("max")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.maxTemp)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                }
                Divider()
                Spacer()
            }.padding(32)
        }
    }
}

struct CircleGradient: View {
    var gradient: LinearGradient
    var title: String
    var body: some View {
        ZStack {
            Path { path in
                path.addArc(center: .init(x: 50, y: 50),
                            radius: 50,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360),
                            clockwise: false)
            }
            .fill(gradient)
            .frame(width: 100, height: 100)
            WebImageView(urlString: title)
        }
    }
}
