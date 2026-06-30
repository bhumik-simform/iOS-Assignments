//
//  UserDetailsModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 10/06/26.
//

struct UserDetailsModel: Decodable {
    let id: Int
    let firstName: String
    let userName: String
    let lastName: String
    let email: String
    let imageURL: String
    let contactNumber: String
    let company: Company
    
    struct Company: Decodable {
        let name: String
        let title: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case userName = "username"
        case lastName
        case email
        case imageURL = "image"
        case contactNumber = "phone"
        case company
    }
}
