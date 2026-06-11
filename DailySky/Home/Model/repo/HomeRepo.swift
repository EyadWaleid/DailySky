//
//  HomeRepo.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
import Combine
final class HomeRepository: HomeRepoProtocol {
 
    
    private let remoteService: RemoteHomeServiceProtcol
    private let localService: LocalHomeServiceProtocol

    init(
        remoteService: RemoteHomeServiceProtcol,
        localService: LocalHomeServiceProtocol
    ) {
        self.remoteService = remoteService
        self.localService = localService
    }

 
    func startFetching(for city: String) {
        Task {
            do {
                let response = try await fetchFromRemote(for: city)
                save(response)                                       
            } catch let urlError as URLError {
                switch urlError.code {
                case .notConnectedToInternet: print(NetworkError.noConnection)
                case .timedOut:               print(NetworkError.timeout)
                default:                      print(NetworkError.unknown(urlError))
                }
            } catch {
                print(NetworkError.unknown(error))
            }
        }
    }

    private func fetchFromRemote(for city: String) async throws -> WeatherResponse {
        try await remoteService.fetchCurrentWeatherData(countryname: city)
    }

    private func save(_ response: WeatherResponse) {
        localService.saveHomeWeatherData(homeData: response)
    }

    func loadHomeWeatherData() -> AnyPublisher<HomeWeatherEntitiy?, Never> {
        localService.loadHomeWeatherData()
    }
}

