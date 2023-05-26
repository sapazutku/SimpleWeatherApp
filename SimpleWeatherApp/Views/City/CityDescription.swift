//
//  CityDescription.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI
import EasySkeleton

struct CityDescription: View {
    var city: City
    @ObservedObject var modelData: ModelData
    var body: some View {
        ScrollView{
            Text("Description").font(.title).padding(.top)
            Divider()
            HStack{
                VStack{
                    
                    HStack{
                        Spacer()
                        Text("Sunrise: ")
                        Image(systemName: "sunrise.fill").foregroundColor(Color.yellow)
                    }
                    Text("\(DateFormatter.localizedString(from: Date(timeIntervalSince1970: TimeInterval(city.sys?.sunrise ?? 0)), dateStyle: .none, timeStyle: .short))")
                    
                    Spacer()
                }.skeletonable().skeletonCornerRadius(15)
                Divider()
                VStack{
                    
                    HStack{
                        Spacer()
                        Text("Sunset: ")
                        Image(systemName: "sunset.fill").foregroundColor(Color.orange)
                    }
                    Text("\(DateFormatter.localizedString(from: Date(timeIntervalSince1970: TimeInterval(city.sys?.sunset ?? 0)), dateStyle: .none, timeStyle: .short))")
                    Spacer()
                }.skeletonable().skeletonCornerRadius(15)
                Divider()
                VStack{
                    
                    HStack{
                        Spacer()
                        Text("Weather :")
                        Image(systemName: getWeatherIcon(iconName: city.weather?[0].icon ?? "01d").0)
                            .foregroundColor(getWeatherIcon(iconName: city.weather?[0].icon ?? "01d").1)
                    }
                    Text("\(city.weather?[0].description ?? "Clear")").font(.caption)
                    //Image(systemName: getWeatherIcon(iconName: city.weather?[0].icon ?? "01d"))
                    Spacer()
                }.skeletonable().skeletonCornerRadius(15).padding(.bottom)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(25)
        .padding(.horizontal)
        .setSkeleton(Binding(get: { self.modelData.isLoading }, set: { self.modelData.isLoading = $0 }))
        Spacer()
    }


    // turn the systemimage icon for the weather description
    func getWeatherIcon(iconName: String) -> (String, Color) {
        var systemName: String
        var color: Color
        
        switch iconName {
        case "01d":
            systemName = "sun.max.fill"
            color = Color.white.opacity(0.5)
        case "01n":
            systemName = "moon.fill"
            color = Color.black.opacity(0.5)
        case "02d":
            systemName = "cloud.sun.fill"
            color = Color.white.opacity(0.5)
        case "02n":
            systemName = "cloud.moon.fill"
            color = Color.black.opacity(0.5)
        case "03d", "03n", "04d", "04n":
            systemName = "cloud.fill"
            color = Color.white.opacity(0.5)
        case "09d", "09n":
            systemName = "cloud.heavyrain.fill"
            color = Color.white.opacity(0.5)
        case "10d":
            systemName = "cloud.sun.rain.fill"
            color = Color.white.opacity(0.5)
        case "10n":
            systemName = "cloud.moon.rain.fill"
            color = Color.black.opacity(0.5)
        case "11d", "11n":
            systemName = "cloud.bolt.rain.fill"
            color = Color.white.opacity(0.5)
        case "13d", "13n":
            systemName = "snow"
            color = Color.white.opacity(0.5)
        case "50d", "50n":
            systemName = "cloud.fog.fill"
            color = Color.white.opacity(0.5)
        default:
            systemName = "sun.max.fill"
            color = Color.white.opacity(0.5)
        }
        
        return (systemName, color)
    }

}

struct CityDescription_Previews: PreviewProvider {
    static var previews: some View {
        CityDescription(city: ModelData().currentCity, modelData: ModelData())
    }
}
