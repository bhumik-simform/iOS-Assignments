//
//  EndPoint.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import Alamofire
import Foundation

enum EndPoint {

    case login(LogInRequestModel)
    case refreshToken(String)
    case currentUser
    case users
    case singleUser(Int)
    case createUser(CreateUserRequestModel)

}

//MARK: HTTP Methods
extension EndPoint {

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }

    var method: HTTPMethod {
        switch self {
        case .login,
            .refreshToken,
            .createUser:

            return .post

        case .currentUser,
            .users,
            .singleUser:

            return .get
        }
    }
}

// MARK: HTTP Method for Alamofire
extension EndPoint.HTTPMethod {
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        }
    }
}

//MARK: URL String
extension EndPoint {

    var url: String {
        switch self {
        case .login: return "https://dummyjson.com/auth/login"
        case .refreshToken: return "https://dummyjson.com/auth/refresh"
        case .currentUser: return "https://dummyjson.com/auth/me"
        case .users: return "https://dummyjson.com/users"
        case .singleUser(let id): return "https://dummyjson.com/users/\(id)"
        case .createUser: return "https://dummyjson.com/users/add"
        }
    }
}

//MARK: body
extension EndPoint {

    var body: Data? {
        switch self {
        case .login(let request):
            return try? JSONEncoder().encode(request)
        case .createUser(let newUser):
            return try? JSONEncoder().encode(newUser)
        case .refreshToken(let refreshToken):
            return try? JSONEncoder().encode(refreshToken)
        default:
            return nil

        }
    }
}

//MARK: Headers
extension EndPoint {

    var headers: [String: String] {
        var headers = [
            "Content-type": "application/json"
        ]

        switch self {
        case .currentUser:
            if let token = TokenManager.shared.accessToken {
                headers["Authorization"] = "Bearer \(token)"
            }
        default: break
        }
        return headers
    }
}
