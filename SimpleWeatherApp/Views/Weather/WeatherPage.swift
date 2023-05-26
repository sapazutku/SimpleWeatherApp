//
//  WeatherView.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct WeatherPage: View {
    @EnvironmentObject var modelData: ModelData
    var city: City
    
    var body: some View {
        
        ZStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: weatherGradient), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: Animations
                if city.weather?[0].main == "Rain" {
                    SpriteView(scene: RainFall(), options: [.allowsTransparency])
                }
                if city.weather?[0].main == "Snow"{
                    SpriteView(scene: Snow(), options: [.allowsTransparency])
                }
                if city.weather?[0].main == "Clouds"{
                    SpriteView(scene: CloudScene(size: CGSize(width: 1250, height: 2500)), options: [.allowsTransparency])
                }
                if city.weather?[0].main == "Drizzle" {
                    SpriteView(scene: Drizzle(), options: [.allowsTransparency])
                }
                
                if city.weather?[0].main == "Clear" {
                    SpriteView(scene: SunnyScene(size: CGSize(width: 1250, height: 2500)), options: [.allowsTransparency])
                }
                
                // MARK: Content
            }
            VStack {
                ScrollView{
                    CityHeader(city: city, modelData: modelData).padding(.horizontal)
                    Divider()
                    CityWeather(city: city, modelData: modelData )
                    Divider()
                    CityDescription(city: city, modelData: modelData)
                }
            }
            .background(Color.white.opacity(0.5))
        }
    }
    
    var weatherGradient: [Color] {
        switch city.weather?[0].main {
        case "Clear":
            return [Color.orange, Color.blue]
        case "Clouds":
            return [Color.gray, Color.blue]
        case "Rain":
            return [Color.gray, Color.darkBlue]
        case "Snow":
            return [Color.white, Color.lightGray]
        case "Drizzle":
            return [Color.lightBlue, Color.gray]
        case "Thunderstorm":
            return [Color.black, Color.darkGray]
        case "Mist", "Fog":
            return [Color.lightGray, Color.darkGray]
        default:
            return [Color.blue, Color.purple]
        }
    }
    
    
}


struct WeatherPage_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPage(city: ModelData().currentCity).environmentObject(ModelData())
    }
}
