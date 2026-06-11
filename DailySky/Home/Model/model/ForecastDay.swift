//
//  ForecastDay.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
struct ForecastDay: Decodable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date, day, hour
        case dateEpoch = "date_epoch"
    }
}
