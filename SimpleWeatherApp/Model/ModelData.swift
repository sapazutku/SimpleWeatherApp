//
//  ModelData.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import Foundation
import Combine

class ModelData: ObservableObject {
    @Published var cities: [City] = [] //load("cityData.json")
    @Published var currentCity: City = City(id: 1, name: "İstanbul", coord: Coordinates(lon: 100, lat: 100), temperature: Temperature(current: 10, high: 12, low: 8), weather: Weather(description: "cloudy", humidity: 10.1, windSpeed: 100, seaLevel: 2))
    
    var exampleCity = City(id: 1, name: "İstanbul", coord: Coordinates(lon: 100, lat: 100), temperature: Temperature(current: 10, high: 12, low: 8), weather: Weather(description: "sunny", humidity: 10.1, windSpeed: 100, seaLevel: 2))
    
    var exampleSunnyCity = City(id: 1, name: "İstanbul", coord: Coordinates(lon: 100, lat: 100), temperature: Temperature(current: 10, high: 12, low: 8), weather: Weather(description: "sunny", humidity: 10.1, windSpeed: 100, seaLevel: 2))

}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename):\n\(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(filename) as \(T.self):\n\(error)")
    }
}

// example City


struct City: Codable, Identifiable {
    var id: Int
    var name: String
    var state: String?
    var country: String?
    var coord: Coordinates
    var temperature: Temperature?
    var weather: Weather?
    
    enum CodingKeys: String, CodingKey {
        case id, name, state, country, coord
    }
}


struct Weather: Codable {
    var description: String
    var humidity: Double
    var windSpeed: Double
    var seaLevel: Double
}


struct Temperature: Codable {
    var current: Double
    var high: Double
    var low: Double
}

struct Coordinates: Codable {
    var lon: Double
    var lat: Double
}


    




