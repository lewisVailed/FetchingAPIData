//
//  ViewCryptoController.swift
//  FetchingAPIData
//
//  Created by Ayberk Bilgiç on 27.02.2024.
//

import UIKit

class ViewCryptoController: UIViewController {

    // MARK: - Variable
    let viewModel: ViewCryptoControllerViewModel
    
    // MARK: - UI Components
    private let coinLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(systemName: "questionmark")
        logo.tintColor = .label
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let marketCapLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let maxSupplyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 200
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    // Stacking Label
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [rankLabel, priceLabel, marketCapLabel, maxSupplyLabel])
        vStack.axis = .vertical
        vStack.spacing = 12
        vStack.alignment = .center
        vStack.distribution = .fill
        return vStack
    }()

    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIScrollView()
        
        return contentView
    }()
    
    // MARK: - Lifecycle
    init(_ viewModel: ViewCryptoControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        self.rankLabel.text = self.viewModel.rankLabel
        self.priceLabel.text = self.viewModel.priceLabel
        self.marketCapLabel.text = self.viewModel.marketCapLabel
        self.maxSupplyLabel.text = self.viewModel.maxSupplyLabel
        
        self.viewModel.onImageLoaded = { [weak self] logoImage in
            DispatchQueue.main.async {
                self?.coinLogo.image = logoImage
            }
            
        }
        
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.navigationItem.title = self.viewModel.coin.name
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(didTapBackButton))
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(coinLogo)
        self.contentView.addSubview(vStack)
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let height = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        height.priority = UILayoutPriority(1)
        height.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
                        
            coinLogo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            coinLogo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            coinLogo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            coinLogo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            coinLogo.heightAnchor.constraint(equalToConstant: 150),
                        
            vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: self.coinLogo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }

    // MARK: - Selectors
    @objc private func didTapBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
