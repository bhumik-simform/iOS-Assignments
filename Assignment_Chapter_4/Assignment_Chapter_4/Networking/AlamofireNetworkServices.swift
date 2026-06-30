//
//  URLSessionNetworkServices.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//
import Alamofire

final class AlamofireNetworkServices: NetworkService {
    func request<T>(endpoint: EndPoint, responceType: T.Type) async throws -> T where T : Decodable {
        return try await withCheckedThrowingContinuation { continuation in
            
            AF.request(
                endpoint.url,
                method: endpoint.method.alamofireMethod,
                parameters: nil,
                encoding: JSONEncoding.default,
                headers: HTTPHeaders(endpoint.headers)
            ) { request in
                request.httpBody = endpoint.body
            }
            .validate()
            .responseDecodable(of: responceType) { responce in
                switch responce.result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    print(error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            }
            
        }
    }
}
