//
//  HomeRepoProtcol.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
import Combine
protocol HomeRepoProtocol {
    func startFetching(for city: String)
    func loadHomeWeatherData() -> AnyPublisher<HomeWeatherEntitiy?, Never>
}
