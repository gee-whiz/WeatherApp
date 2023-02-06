//
//  ConditionView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct ConditionView: View {

    @State var currentWeather: CurrentWeatherViewModel

    var body: some View {
        ZStack {
            HStack {
                ConditionItemView(title: currentWeather.windMph,
                                  iconName: "wind",
                                  subTitle: "wind")
                ConditionItemView(title: currentWeather.humidity,
                                  iconName: "humidity",
                                  subTitle: "humidity")
                ConditionItemView(title: currentWeather.precipitation,
                                  iconName: "cloud.sun.rain",
                                  subTitle: "precipitation")
            }.background(Color.accentColor)
                .cornerRadius(8)
                .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity)
    }
}
