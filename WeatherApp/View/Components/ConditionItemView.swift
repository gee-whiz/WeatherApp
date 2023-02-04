//
//  ConditionItemView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct ConditionItemView: View {
    var title: String
    var iconName: String
    var subTitle: LocalizedStringKey
    var body: some View {
        HStack {
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
