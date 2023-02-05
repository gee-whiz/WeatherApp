//
//  WeatherView.swift
//  WeatherApp
//
//  Created by George Kapoya on 4.2.2023.
//

import SwiftUI

struct WeatherView: View {

    var weatherViewModel: WeatherViewModel
    @State private var selectedOption = 0

    var body: some View {
        
        if let location = weatherViewModel.location {
            HeaderView(location: location, selectedOption: $selectedOption)
        }
        
        if let currentWeather = weatherViewModel.currentWeather {
            CurrentWeatherView(currentWeather: currentWeather)
            ConditionView(currentWeather: currentWeather)
        }
        
        Picker(selection: $selectedOption, label: Text("")) {
            Text("today").tag(0)
            Text("forecast").tag(1)
        }.background(Color.accentColor)
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        if selectedOption == 0 {
            HourlyView(hours: weatherViewModel.todayWeather)
            if let locationViewModel = weatherViewModel.location,
                let currentWeather = weatherViewModel.currentWeather {
                withAnimation {
                    MapView(location: locationViewModel, currentWeather: currentWeather)
                }
            }
        } else {
            DailyView(forecastWeather: weatherViewModel.forecastWeather)
        }
        Spacer()
    }
}
