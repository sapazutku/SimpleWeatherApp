//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()

    var body: some View {
        ZStack{
            Color.primary
                    .edgesIgnoringSafeArea(.all)
            TabView {
                WeatherPage(city: ModelData().currentCity)
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun.fill")
                    }

                CitySelection()
                    .tabItem {
                        Label("Cities", systemImage: "list.bullet")
                    }
            }
            .environmentObject(modelData)
            .accentColor(.accentColor)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
