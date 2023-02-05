//
//  WebImageView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct WebImageView: View {

    var urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 50)
                .tint(.white)
        } placeholder: {
            ProgressView()
        }
    }
}
