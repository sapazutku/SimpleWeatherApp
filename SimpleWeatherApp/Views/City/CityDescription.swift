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
        VStack{
            Text("Description").font(.title).padding()
            HStack{
                Spacer()
                Text("Sunrise: \(city.sys?.sunrise ?? 0, specifier: "%.1f")")
                Spacer()
                Image(systemName: "sunrise.fill").foregroundColor(Color.yellow)
                Spacer()
            }
            HStack{
                Spacer()
                Text("Sunset: \(city.sys?.sunset ?? 0, specifier: "%.1f")")
                Spacer()
                Image(systemName: "sunset.fill").foregroundColor(Color.orange)
                Spacer()
            }
            HStack{
                Spacer()
                Text("Weather is mostly \(city.weather?[0].icon ?? "Unknown")")
                Spacer()
                Image(systemName: getWeatherIcon(iconName: city.weather?[0].icon ?? "01d"))
                Spacer()
            }

        }
        // alignment of the text
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all)
        Spacer()
    }


    // turn the systemimage icon for the weather description
    func getWeatherIcon(iconName: String) -> String {
        switch iconName {
        case "01d":
            return "sun.max.fill"
        case "01n":
            return "moon.fill"
        case "02d":
            return "cloud.sun.fill"
        case "02n":
            return "cloud.moon.fill"
        case "03d":
            return "cloud.fill"
        case "03n":
            return "cloud.fill"
        case "04d":
            return "cloud.fill"
        case "04n":
            return "cloud.fill"
        case "09d":
            return "cloud.heavyrain.fill"
        case "09n":
            return "cloud.heavyrain.fill"
        case "10d":
            return "cloud.sun.rain.fill"
        case "10n":
            return "cloud.moon.rain.fill"
        case "11d":
            return "cloud.bolt.rain.fill"
        case "11n":
            return "cloud.bolt.rain.fill"
        case "13d":
            return "snow"
        case "13n":
            return "snow"
        case "50d":
            return "cloud.fog.fill"
        case "50n":
            return "cloud.fog.fill"
        default:
            return "sun.max.fill"
        }
    }
}

struct CityDescription_Previews: PreviewProvider {
    static var previews: some View {
        CityDescription(city: ModelData().exampleCity)
    }
}
