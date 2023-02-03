//
//  ConditionView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct ConditionView: View {
    var currentWeather: CurrentWeather
    var body: some View {
        ZStack {
            HStack {
                ConditionItemView(title: "\(String(currentWeather.windMph))m/s",
                                  iconName: "wind",
                                  subTitle: wind)
                ConditionItemView(title: "\(String(currentWeather.humidity))%",
                                  iconName: "humidity",
                                  subTitle: humidity)
                ConditionItemView(title: "\(String(currentWeather.precip))",
                                  iconName: "cloud.sun.rain",
                                  subTitle: precipitation)
            }.background(Color.accentColor)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
    }
}


struct ConditionItemView: View {
    var title: String
    var iconName: String
    var subTitle: String
    var body: some View {
        HStack() {
            VStack(alignment: .center) {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .padding(3)
                Text(title)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(subTitle)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }.frame(maxWidth: .infinity)
                .padding(8)
        }
    }
}
