//
//  CityHeader.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct CityHeader: View {
    var city: City
    
    var body: some View {
        
        VStack {
            Text(city.name)
                .font(.largeTitle)
                .bold()
            
            VStack {
                Text("Current: \(city.temperature?.current ?? 0, specifier: "%.1f")°")
                    .font(.headline)
                Text("Feels Like: \(city.temperature?.current ?? 0, specifier: "%.1f")°")
                    .font(.headline)
                HStack{
                    Text("H: \(city.temperature?.high ?? 0, specifier: "%.1f")°")
                    Text("L: \(city.temperature?.low ?? 0, specifier: "%.1f")°")
                }
            }
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(25)
    }
}


struct CityHeader_Previews: PreviewProvider {
    static var previews: some View {
        CityHeader(city: ModelData().exampleCity)
    }
}
