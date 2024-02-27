//
//  CoinCell.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 25.02.2024.
//

import UIKit

class CoinCell: UITableViewCell {
    
    static let identifier = "CoinCell"
    
    // MARK: - Variables
    private(set) var coin: Coin!
    
    // MARK: - UI Components
    private let coinLogo: UIImageView = {
        let cl = UIImageView()
        cl.image = UIImage(systemName: "questionmark")
        cl.contentMode = .scaleAspectFit
        cl.tintColor = .black
        return cl
    }()
    
    private let coinName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .label
        label.text = "title"
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with coin: Coin) {
        self.coin = coin
        self.coinName.text = coin.name
        
        let imageData = try? Data(contentsOf: self.coin.logoURL!)
        if let imageData = imageData {
            DispatchQueue.main.async { [weak self] in
                self?.coinLogo.image = UIImage(data: imageData)
            }
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(coinLogo)
        self.addSubview(coinName)
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        coinName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            coinLogo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            coinName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinName.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor, constant: 16)
        
        ])
        
        
        
    }
    
}
