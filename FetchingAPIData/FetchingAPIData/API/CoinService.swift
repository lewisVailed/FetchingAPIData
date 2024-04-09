//
//  CoinService.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 19.03.2024.
//

import Foundation

enum CoinServiceError: Error {
    case serverError(CoinError)
    case unknown(String = "An unknown error occurred.")
    case decodingError(String = "Error parsing server response.")
    
}

class CoinService {
    
    static func fetchCoins(with endpoint: Endpoint, completion: @escaping (Result<[Coin], CoinServiceError>)->Void) {
        
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, resp, error in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                // write later
            }
            
            
        }
    }
}
