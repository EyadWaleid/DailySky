//
//  HomeViewModel.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
import Combine
@MainActor

class HomeViewModel: ObservableObject {
    @Published var state: WeatherState = .loading

    private let repository: HomeRepoProtocol
    private var cancellables = Set<AnyCancellable>()

    init(repository: HomeRepoProtocol) {
        self.repository = repository
        repository.startFetching(for: "London")
        bindWeather()
    }

    private func bindWeather() {
        repository
            .loadHomeWeatherData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] entity in
                guard let self else { return }
                guard let entity else {
                    self.state = .loading
                    return
                }
                self.state = .success(self.mapToUIModel(entity))
            }
            .store(in: &cancellables)
    }

    private func mapToUIModel(_ entity: HomeWeatherEntitiy?) -> WeatherUIModel {
        let forecastEntities = entity?.forecastArray?.allObjects as? [ForecastDayEntity] ?? []
        let forecasts = forecastEntities.map { forecast in
            ForecastUIModel(
                day: forecast.day ?? "",
                highTemp: Int(forecast.maxTemp),
                lowTemp: Int(forecast.minTemp),
                wind: "\(forecast.windSpeed)", conditionText: forecast.conditionText ?? "",
                conditionIcon: forecast.conditionIcon ?? "",
                uv:String(format: "%.0f", forecast.uv) , humditiy:  "\(forecast.humidity )", temperature:  "\(forecast.temp )", pressure: String(format: "%.0f", forecast.pressure) 
            )
        }

        return WeatherUIModel(
            country: entity?.location?.country ?? "Unknown",
            temperature: "\(entity?.currentWeather?.temp ?? 0)",
            conditionText: entity?.currentWeather?.conditionText ?? "", conditionIcon:  entity?.currentWeather?.conditionIcon ?? "",
            humditiy:" \(Double(entity?.currentWeather?.humidity ?? 0))",
            wind: "\(entity?.currentWeather?.windKph ?? 0)",
            pressure: "\(entity?.currentWeather?.pressure ?? 0)",
            uv: "\(entity?.currentWeather?.uv ?? 0)",
            isDay: (entity?.currentWeather?.isDay ?? 0) == 0 ? false : true,
            forecasts: forecasts
        )
    }
    private func englishNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.maximumFractionDigits = 1
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    private func englishInt(_ value: Double) -> Int {
        Int(value)
    }
}
enum WeatherState {
    case loading
    case success(WeatherUIModel)
    case error(String)
}
