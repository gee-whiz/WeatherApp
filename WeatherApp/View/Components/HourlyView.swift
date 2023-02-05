//
//  HourlyView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct HourlyView: View {

    var hours: [HourlyViewModel]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(hours) {  hour in
                    VStack {
                        Text(hour.time)
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                        WebImageView(urlString: hour.iconUrl)
                        Text(hour.tempreture)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                    }
                    .frame(width: 110, height: 110)
                    .background(Color.accentColor)
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 0)
                }
            }
        }
    }
}
