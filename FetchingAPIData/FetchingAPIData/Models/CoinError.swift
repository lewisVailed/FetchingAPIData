//
//  CoinError.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 10.03.2024.
//

import Foundation

struct CoinStatus: Decodable {
    let status: CoinError
}

struct CoinError: Decodable {
    let errorCode: Int
    let errorMessage: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}
