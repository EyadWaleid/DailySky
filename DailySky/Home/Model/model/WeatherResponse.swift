//
//  WeatherResponse.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
struct WeatherResponse : Codable{
    let location: Location
       let current: CurrentWeather
       let forecast: Forecast
}
