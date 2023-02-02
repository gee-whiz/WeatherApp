//
//  ContentView.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel

      init(weatherRepository: WeatherRepositoryProtocol) {
          self.weatherViewModel = WeatherViewModel(weatherRepository: weatherRepository)
      }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            ForEach(0..<self.weatherViewModel.todayWeather.count, id: \.self) { i in
                Text(String(self.weatherViewModel.todayWeather[i].tempC))
            }

        }
        .padding()
    }
}


