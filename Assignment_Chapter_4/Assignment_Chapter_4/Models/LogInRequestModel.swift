//
//  LogInRequestModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

struct LogInRequestModel: Encodable {

    let userName: String
    let password: String

    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
}
