//
//  HomeServiceRemoteProtcol'.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
import Combine
protocol LocalHomeServiceProtocol {
    func loadHomeWeatherData() -> AnyPublisher <HomeWeatherEntitiy? , Never>
    func saveHomeWeatherData(homeData : WeatherResponse)
}
