//
//  ContentView.swift
//  WeatherApp
//
//  Created by George Kapoya on 2.2.2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    switch weatherViewModel.viewState {
                    case .initial:
                        ProgressView("loading")
                    case .failure:
                        Text(weatherViewModel.errorMessage)
                            .foregroundColor(.primary)
                            .padding()
                    case .loaded:
                        WeatherView(weatherViewModel: weatherViewModel)
                    }
                }
                .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}
