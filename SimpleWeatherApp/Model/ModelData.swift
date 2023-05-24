//
//  ModelData.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import Foundation
import Combine
import Moya
import CoreLocation

class ModelData: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var cities: [City] = loadJSON("cityData.json")
    @Published var currentCity: City = City(id: 1, name: "Istanbul", coord: Coordinate(lon: 100, lat: 100), weather: [Weather(id: 1, main: "Cloudy", description: "scattered clouds", icon: "01n")], main: Main(temp: 10, feels_like: 100, temp_min: 100, temp_max: 100, pressure: 1, humidity: 1, sea_level: 1, grnd_level: 1), visibility: 1, wind: Wind(speed: 1, deg: 1, gust: 1), clouds: Clouds(all: 1), dt: 1, sys: Sys(country: "TR", sunrise: 1, sunset: 1), timezone: 1, cod: 1)
    // searched city
    @Published var searchedCity: City? = nil
    let locationManager = CLLocationManager()
    
    private let provider = MoyaProvider<WeatherAPI>()
    @Published var isLoading = false
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        fetchWeatherByCoordinates(lat: locationManager.location?.coordinate.latitude ?? 21, lon: locationManager.location?.coordinate.longitude ?? 48)
        
    }
    
    
    // CLLocationManager Delegate Method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            //fetchWeatherByCoordinates(lat: lat, lon: lon)
            print("Latitude: \(lat)")
            print("Longitude: \(lon)")
        }
    }
    
    func fetchWeatherByCoordinates(lat: Double, lon: Double) {
        self.isLoading = true
        provider.request(.weatherByCoordinates(lat: lat, lon: lon)) { result in
            switch result {
            case let .success(response):
                do {
                    let city = try JSONDecoder().decode(City.self, from: response.data)
                    // print response
                    print("fetchWeatherByCoordinates: \(response.data)")
                    DispatchQueue.main.async {
                        print("City: \(city.name)")
                        self.currentCity = city
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isLoading = false
                        }
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchWeatherById(id: Int) {
        self.isLoading = true
        provider.request(.weatherById(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let city = try JSONDecoder().decode(City.self, from: response.data)
                    print("fetchWeatherById: \(response.data)")
                    print("fetchWeatherById: \(city)")
                    
                    DispatchQueue.main.async {
                        //self.currentCity = city
                        self.searchedCity = city
                        print("Requested City : \(self.searchedCity?.name)")
                        // wait 2 seconds to see the skeleton animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isLoading = false
                        }
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
    
    
    
    
    
}

func loadJSON<T: Decodable>(_ filename: String) -> T {
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
