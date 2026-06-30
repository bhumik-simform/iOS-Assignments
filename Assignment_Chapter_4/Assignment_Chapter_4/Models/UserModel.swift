//
//  UserModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

struct UserModel: Decodable {

    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let userName: String
    let imageURL: String

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case userName = "username"
        case imageURL = "image"
    }

}
