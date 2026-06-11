//
//  UIHomeModel.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import Foundation
struct WeatherUIModel {
    let country: String
    let temperature: String
    let conditionText: String
    let conditionIcon: String
    let humditiy : String
    let wind : String
    let pressure : String
    let uv : String
    let isDay : Bool
    let forecasts: [ForecastUIModel]
}
struct ForecastUIModel : Identifiable , Hashable{
    let id = UUID()
    let day: String
    let highTemp: Int
    let lowTemp: Int
    let wind : String
    let conditionText: String
    let conditionIcon: String
    let uv : String
    let humditiy : String
    let temperature : String
    let pressure : String
}
