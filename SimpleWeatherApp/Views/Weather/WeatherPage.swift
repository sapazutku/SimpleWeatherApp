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
    
    // weatherScenes combine background with animation
    struct WeatherScene {
        let gradientColors: [Color]
        let spriteScene: SKScene
    }
    
    let weatherScenes: [String: WeatherScene] = [
        "Clear": WeatherScene(
            gradientColors: [Color.orange, Color.blue],
            spriteScene: SunnyScene(size: CGSize(width: 1250, height: 2500))
        ),
        "Clouds": WeatherScene(
            gradientColors: [Color.gray, Color.blue],
            spriteScene: CloudScene(size: CGSize(width: 1250, height: 2500))
        ),
        "Rain": WeatherScene(
            gradientColors: [Color.gray, Color.darkBlue],
            spriteScene: RainFall()
        ),
        "Snow": WeatherScene(
            gradientColors: [Color.white, Color.lightGray],
            spriteScene: Snow()
        ),
        "Drizzle": WeatherScene(
            gradientColors: [Color.lightBlue, Color.gray],
            spriteScene: Drizzle()
        )
    ]
    
    var body: some View {
        let weatherMain = city.weather?[0].main ?? "Clear"  // Default to "Clear"
        let weatherScene = weatherScenes[weatherMain] ?? weatherScenes["Clear"]!  // Default to "Clear" scene if not found
        
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: weatherScene.gradientColors), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Animation
            SpriteView(scene: weatherScene.spriteScene, options: [.allowsTransparency])
            
            // Content
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
}



struct WeatherPage_Previews: PreviewProvider {
    static var previews: some View {
        WeatherPage(city: ModelData().currentCity).environmentObject(ModelData())
    }
}
