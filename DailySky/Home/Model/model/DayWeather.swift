//
//  DayWeather.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
struct DayWeather: Codable {
    let maxtempC: Double
    let mintempC: Double
    let avgtempC: Double
    let dailyChanceOfRain: Int
    let avghumidity: Int
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case avghumidity
        case condition
    }
}
