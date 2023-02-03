//
//  HeaderView.swift
//  WeatherApp
//
//  Created by George Kapoya on 3.2.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @State var location: Location
    @Binding var selectedOption: Int
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                Text(location.localtime)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Button {
                selectedOption = selectedOption == 1 ? 0 : 1
            } label: {
                Image(systemName: selectedOption == 1 ? "square.grid.2x2.fill" : "rectangle.grid.1x2.fill")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            }
        }.padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(location: Location(name: "Helsinki", lat: 1.0, lon: 3.3, localtime: "12 September, Monday"), selectedOption: .constant(0)).previewLayout(.sizeThatFits)
    }
}
