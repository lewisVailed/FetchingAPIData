//
//  Endpoint.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 14.03.2024.
//

import Foundation

enum Endpoint {
    
    case fetchCoins(url: String = "/v1/cryptocurrency/listings/latest")
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.queryItems = []
        components.port = Constants.port
        components.path =
        
        return components.url
    }
    
}
