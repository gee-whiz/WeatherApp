//
//  ContentView.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherViewModel = WeatherViewModel()
    @State private var selectedOption = 0
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    if let location = self.weatherViewModel.location {
                        HeaderView(location: location, selectedOption: $selectedOption)
                    }
                    if let currentWeather = self.weatherViewModel.currentWeather {
                        CurrentWeatherView(currentWeather: currentWeather)
                        ConditionView(currentWeather: currentWeather)
                    }
                    VStack() {
                        Picker(selection: $selectedOption, label: Text("")) {
                            Text("today").tag(0)
                            Text("forecast").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                        if selectedOption == 0 {
                            HourlyView(hours: self.weatherViewModel.todayWeather)
                            MapView(region: weatherViewModel.region)
                        } else {
                            DailyView(forecastWeather: self.weatherViewModel.forecastWeather)
                        }
                    }.padding()
                    Spacer()
                }
                .padding()
            }
        } .preferredColorScheme(.dark)
    }
}


