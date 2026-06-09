//
//  CreateUserRequestModel.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

struct CreateUserRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let userName: String
    let imageURL: String
    let email: String
    let contactNumber: String
    let company: Company
    
    struct Company: Encodable {
        let name: String
        let title: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case firstName
        case userName = "username"
        case lastName
        case email
        case imageURL = "image"
        case contactNumber = "phone"
        case company
    }
}
