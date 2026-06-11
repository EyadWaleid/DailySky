//
//  DayWeather.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
struct Day: Decodable {
    let maxtempC: Double
    let mintempC: Double
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case condition
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
    }
}
