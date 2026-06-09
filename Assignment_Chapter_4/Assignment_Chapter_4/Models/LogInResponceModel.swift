//
//  LogInResponce.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

struct LogInResponceModel: Decodable {
    let id: Int
    let accessToken: String
    let refreshToken: String
}
