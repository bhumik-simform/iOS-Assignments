//
//  APIError.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponce
    case decodingError
    case serverError(String)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError: return "Unable to decode"
        case .invalidURL: return "Check URL"
        case .invalidResponce: return "Error in responce"
        case .serverError(let message): return "Throw by server with \(message)"
        }
    }
}
