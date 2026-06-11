//
//  WeatherResponse.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

struct WeatherResponse: Decodable {
    let location: Location
    let currentWeather: CurrentWeather
    let forecast: Forecast
  
        
        enum CodingKeys: String, CodingKey {
            case location
            case forecast
            case currentWeather = "current"  
        }
    
}










