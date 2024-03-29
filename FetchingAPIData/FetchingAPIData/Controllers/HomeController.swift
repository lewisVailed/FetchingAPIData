//
//  HomeController.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 15.02.2024.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Variables
    private let coins: [Coin] = [
        Coin(id: 1, name: "Bitcoin", maxSupply: 200, rank: 1, pricingData: PricingData(CAD: CAD(price: 50000, market_cap: 1_000_000))),
        Coin(id: 2, name: "Ethereum", maxSupply: nil, rank: 2, pricingData: PricingData(CAD: CAD(price: 2000, market_cap: 500_000))),
        Coin(id: 3, name: "Monero", maxSupply: nil, rank: 3, pricingData: PricingData(CAD: CAD(price: 200, market_cap: 250_000)))
    
    
    ]
    
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tableview
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Crypto"
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
    }

}

// MARK: - Table View Functions
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else {
            fatalError("Unable to dequeue CoinCell in HomeController")
        }
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let coin = self.coins[indexPath.row]
        let vm = ViewCryptoControllerViewModel(coin)
        let vc = ViewCryptoController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
