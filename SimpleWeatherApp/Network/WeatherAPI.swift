//
//  WeatherAPI.swift
//  SimpleWeatherApp
//
//  Created by utku on 24.05.2023.
//

import Moya
import Foundation

enum WeatherAPI {
    case weatherByCoordinates(lat: Double, lon: Double)
    case weatherById(id: Int)
}

extension WeatherAPI: TargetType {
    var baseURL: URL { return URL(string: "https://api.openweathermap.org/data/2.5")! }

    var path: String {
        switch self {
        case .weatherByCoordinates, .weatherById:
            return "/weather"
        }
    }

    var method: Moya.Method {
        switch self {
        case .weatherByCoordinates, .weatherById:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .weatherByCoordinates(lat, lon):
            return .requestParameters(parameters: ["lat": lat, "lon": lon,"units": "metric", "appid": "53609485ee8d32929ce452d8cdb1f82e"], encoding: URLEncoding.default)
        case let .weatherById(id):
            return .requestParameters(parameters: ["id": id, "units": "metric", "appid": "53609485ee8d32929ce452d8cdb1f82e"], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}

