//
//  ForecastDay.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
struct ForecastDay: Codable, Identifiable {

    var id: String { date }

    let date: String
    let dateEpoch: Int
    let day: DayWeather

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
    }
}
