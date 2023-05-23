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
    @Published var currentCity: City = City(id: 1, name: "IStanbul", coord: Coordinate(lon: 100, lat: 100), weather: [Weather(id: 1, main: "Cloudy", description: "scattered clouds", icon: "01n")], main: Main(temp: 10, feels_like: 100, temp_min: 100, temp_max: 100, pressure: 1, humidity: 1, sea_level: 1, grnd_level: 1), visibility: 1, wind: Wind(speed: 1, deg: 1, gust: 1), clouds: Clouds(all: 1), dt: 1, sys: Sys(country: "TR", sunrise: 1, sunset: 1), timezone: 1, cod: 1)
    
    var exampleCity = City(id: 1, name: "IStanbul", coord: Coordinate(lon: 100, lat: 100), weather: [Weather(id: 1, main: "Cloudy", description: "scattered clouds", icon: "01n")], main: Main(temp: 10, feels_like: 100, temp_min: 100, temp_max: 100, pressure: 1, humidity: 1, sea_level: 1, grnd_level: 1), visibility: 1, wind: Wind(speed: 1, deg: 1, gust: 1), clouds: Clouds(all: 1), dt: 1, sys: Sys(country: "TR", sunrise: 1, sunset: 1), timezone: 1, cod: 1)
    
    var exampleSunnyCity = City(id: 1, name: "IStanbul", coord: Coordinate(lon: 100, lat: 100), weather: [Weather(id: 1, main: "Cloudy", description: "scattered clouds", icon: "01n")], main: Main(temp: 10, feels_like: 100, temp_min: 100, temp_max: 100, pressure: 1, humidity: 1, sea_level: 1, grnd_level: 1), visibility: 1, wind: Wind(speed: 1, deg: 1, gust: 1), clouds: Clouds(all: 1), dt: 1, sys: Sys(country: "TR", sunrise: 1, sunset: 1), timezone: 1, cod: 1)

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


struct Temperature: Codable {
    var current: Double
    var high: Double
    var low: Double
}

struct Coordinates: Codable {
    var lon: Double
    var lat: Double
}
