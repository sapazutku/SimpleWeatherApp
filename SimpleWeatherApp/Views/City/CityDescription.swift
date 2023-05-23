//
//  CityDescription.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct CityDescription: View {
    var city: City

    var body: some View {
        Divider()
        Text(city.weather?.description ?? "")
            .padding()
            .cornerRadius(10)
        Spacer()
    }
}

struct CityDescription_Previews: PreviewProvider {
    static var previews: some View {
        CityDescription(city: ModelData().exampleCity)
    }
}
