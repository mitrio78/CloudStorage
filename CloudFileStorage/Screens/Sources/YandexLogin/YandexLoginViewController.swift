//
//  YandexLoginViewController.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 28.02.2024.
//

import UIKit

final class YandexLoginViewController: UIViewController {
    let viewModel: YandexLoginLogic
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.masksToBounds = true
        button.anchor(width: 48, height: 48)
        button.layer.cornerRadius = 24
        return button
    }()
    
    init(viewModel: YandexLoginLogic) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    @objc
    func closeButtonTapped() {
        dismiss(animated: true)
    }
}

extension YandexLoginViewController: ViewConfigurable {
    func setupViews() {
        view.addSubview(closeButton)
    }
    
    func setupConstraints() {
        closeButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.trailingAnchor, paddingTop: 20, paddingRight: 30)
    }
}
