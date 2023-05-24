//
//  CityHeader.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI
import EasySkeleton

struct CityHeader: View {
    var city: City
    @ObservedObject var modelData: ModelData
    
    var body: some View {
        
        VStack {
            VStack{
                Text(city.name)
                    .font(.largeTitle)
                    .bold()
                    .skeletonable()
                    .skeletonCornerRadius(15)
                VStack {
                    Text("Current: \(city.main?.temp ?? 0, specifier: "%.1f")°")
                        .font(.headline)
                        
                    Text("Feels Like: \(city.main?.feels_like ?? 0, specifier: "%.1f")°")
                        .font(.headline)
                        
                    HStack{
                        HStack{
                            Image(systemName: "thermometer.high").foregroundColor(Color.red)
                            
                            Text("H: \(city.main?.temp_max ?? 0, specifier: "%.1f")°")
                        }
                        HStack{
                            Image(systemName: "thermometer.low").foregroundColor(Color.blue)
                            Text("L: \(city.main?.temp_min ?? 0, specifier: "%.1f")°")
                        }
                    }
                }
            }
            .skeletonable()
            .skeletonCornerRadius(15)
        }
        .padding(.all)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(25)
        .setSkeleton(Binding(get: { self.modelData.isLoading }, set: { self.modelData.isLoading = $0 }))
        
    }
}


struct CityHeader_Previews: PreviewProvider {
    static var previews: some View {
        CityHeader(city: ModelData().currentCity, modelData: ModelData())
    }
}
