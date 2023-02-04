//
//  Extension+Image.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

extension Image {
    func resized() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 80)
    }
}
