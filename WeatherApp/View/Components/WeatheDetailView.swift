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
            LinearGradient(gradient: Gradient(colors: [.accentColor, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                HStack {
                    Text(forecastWeather.day)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.app.fill")
                            .tint(.white)
                            .font(.title)
                    }
                }.padding(.vertical)
                CircleGradient(gradient: LinearGradient(
                    gradient: Gradient(colors: [.accentColor, .white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), title: forecastWeather.iconUrl)
                VStack(alignment: .center) {
                    Text(forecastWeather.avgTemp)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Text(forecastWeather.condition) .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }.padding(.vertical)
                Spacer().frame(height: 20)
                DashLine()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10, 5]))
                    .frame(height: 1)
                HStack {
                    VStack {
                        Text("humidity")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.humidity)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack {
                        Text("rain")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.dailyChanceOfRain)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
                DashLine()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10, 5]))
                    .frame(height: 1)
                HStack {
                    VStack {
                        Text("min")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.minTemp)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack {
                        Text("max")
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(forecastWeather.maxTemp)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
                DashLine()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10, 5]))
                    .frame(height: 1)
                Spacer()
            }.padding(.horizontal)
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

struct DashLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        return path
    }
}
