//
//  HomeControllerViewModel.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 9.04.2024.
//

import Foundation

class HomeControllerViewModel {
    
    var onCoinsUpdated: (()->Void)?
    var onErrorMessage: ((CoinServiceError)->Void)?
    
    private(set) var coins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
        
    }
    
    public func fetchCoins() {
        
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
                print("DEBUG PRINT:", "\(coins.count) coins fetched.")
                
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
    
}
