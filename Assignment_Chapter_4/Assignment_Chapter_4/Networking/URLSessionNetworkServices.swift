//
//  URLSessionNetworkServices.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import Foundation

final class URLSessionNetworkServices: NetworkService {
    func request<T: Decodable>(
        endpoint: EndPoint, responceType: T.Type
    ) async throws -> T {
        
        guard let url = URL(string: endpoint.url) else {
            throw APIError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = endpoint.body
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, responce) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponce = responce as? HTTPURLResponse else {
            throw APIError.invalidResponce
        }
        
        switch httpResponce.statusCode {
        case 200...299: break
        default: throw APIError.serverError("Status code: \(httpResponce.statusCode)")
        }
        
        do {
            return try JSONDecoder().decode(responceType, from: data)
        } catch {
            print("Decoding Error")
            throw APIError.decodingError
        }
    }
}
