//
//  RemoteHomeServive.swift
//  DailySky
//
//  Created by Eyad waleed on 10/06/2026.
//

import Foundation
import Alamofire

class RemoteHomeService: RemoteHomeServiceProtcol {

    private let apiKey = "cff21e401ade477584e180934260506"
    private let baseURL = "https://api.weatherapi.com/v1"

    func fetchCurrentWeatherData(countryname: String) async throws -> WeatherResponse {
        let url = "\(baseURL)/forecast.json"
        let parameters: Parameters = [
            "key": apiKey,
            "q": countryname,
            "days" : 4,
            "aqi": "no",
            "lang": "en"
        ]

        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, parameters: parameters)
                .validate()
                .responseDecodable(of: WeatherResponse.self) { response in
                    switch response.result {
                    case .success(let weather):
                        continuation.resume(returning: weather)
                    case .failure(let error):
                        print("❌ Alamofire error: \(error)") 
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
