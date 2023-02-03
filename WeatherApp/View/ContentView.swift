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
            if let location = self.weatherViewModel.location {
               HeaderView(location: location)
            }
            
            if let currentWeather = self.weatherViewModel.currentWeather {
                CurrentWeatherView(currentWeather: currentWeather)
                ConditionView(currentWeather: currentWeather)
            }
           
            Spacer()
        }
    }
}


