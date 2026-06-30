//
//  NetworkService.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

protocol NetworkService {
    func request<T: Decodable>(
        endpoint: EndPoint,
        responceType: T.Type
    ) async throws -> T
}
