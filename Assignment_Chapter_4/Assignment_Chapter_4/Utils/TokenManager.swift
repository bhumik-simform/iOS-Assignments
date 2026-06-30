//
//  TokenManager.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

final class TokenManager {
    
    static let shared = TokenManager()
    
    private init() {}
    
    var id: Int?
    var accessToken: String?
    var refreshToken: String?
    
}
