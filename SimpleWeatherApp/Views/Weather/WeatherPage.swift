//
//  WeatherView.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct WeatherPage: View {
    @EnvironmentObject var modelData: ModelData
    var city: City

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: weatherGradient), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                CityHeader(city: city).padding(.horizontal)
                CityWeather(city: city)
                CityDescription(city: city)
            }
            .background(Color.white.opacity(0.5))
        }
    }

    var weatherGradient: [Color] {
        switch city.weather?[0].description {
        case "clear sky":
            return [Color.orange, Color.blue]
        case "few clouds", "scattered clouds", "broken clouds", "overcast clouds":
            return [Color.gray, Color.blue]
        default:
            return [Color.blue, Color.purple]
        }
    }

}


struct WeatherPage_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPage( city: ModelData().exampleCity)
    }
}
