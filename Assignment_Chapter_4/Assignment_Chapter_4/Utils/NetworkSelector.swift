//
//  NetworkSelector.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

final class NetworkSelector {
    
    static let shared = NetworkSelector()
    
    private init() {}
    
    var currentNetwrokService: NetworkService!
    
}
