//
//  remoteHomeSeviceProtcol.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
protocol RemoteHomeServiceProtcol{
    func fetchCurrentWeatherData(countryname:String) async throws -> WeatherResponse
}
