//
//  NetworkError.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import Foundation
enum NetworkError: Error {
    case noConnection
    case serverError(Int)
    case unauthorized
    case notFound
    case timeout
    case invalidResponse
    case unknown(Error)
}
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noConnection:
            return "No internet connection. Please check your network."
        case .serverError(let code):
            return "Server error (\(code)). Please try again later."
        case .unauthorized:
            return "Session expired. Please log in again."
        case .notFound:
            return "Requested data not found."
        case .timeout:
            return "Request timed out. Please try again."
        case .invalidResponse:
            return "Invalid response from server."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
