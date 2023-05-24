//
//  CityWeather.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct CityWeather: View {
    var city: City

    var body: some View {
        ZStack{
            List {
                CityRow(title: "Humidity", value: "%\(city.main?.humidity ?? 0)", iconName: "drop.fill")
                
                CityRow(title: "Wind", value: "\(city.wind?.speed ?? 0) km/h",value3: "\(city.wind?.gust ?? 0) km/h", iconName: "wind")
               
                CityRow(title: "Sea Level", value: "\(city.main?.sea_level ?? 0) m", iconName: "water.waves")
                
                CityRow(title: "Coordinates", value: "\(city.coord?.lat.rounded() ?? 0)",value2: "\(city.coord?.lon.rounded() ?? 0)", iconName: "location.fill")
            }
            .listStyle(PlainListStyle())
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
        }
        .frame(height: 350)

    }
}

struct CityRow: View {
    var title: String
    var value: String
    var value2: String?
    var value3:String?
    var iconName: String

    var body: some View {
        HStack {
            Rectangle().fill(Color.blue).frame(width: 30, height: 30)
                .cornerRadius(3)
                .opacity(0.2)
            .overlay(
                Image(systemName: iconName)
                    .foregroundColor(Color.white.opacity(0.8))
            )
            Text(title).padding(.leading)
            Spacer()
            //Text(value)
            if (value2 != nil) {
                VStack{
                    Text("Lat: \(value)").lineLimit(1).font(.callout)
                    Text("Long: \(value2!)").lineLimit(1).font(.callout)
                }
            }
            else if(value3 != nil){
                VStack{
                    Text("Speed: \(value)").lineLimit(1).font(.callout)
                    Text("Gust: \(value3!)").lineLimit(1).font(.callout)
                }
            }
            else{
                Text(value)
            }
        }
        .listRowBackground(Color.gray.opacity(0.3))
        .padding()
        
    }
}




struct CityWeather_Previews: PreviewProvider {
    static var previews: some View {
        CityWeather(city: ModelData().currentCity)
    }
}
