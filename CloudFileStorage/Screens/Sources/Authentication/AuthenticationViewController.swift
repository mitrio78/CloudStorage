//
//  AuthenticationViewController.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import UIKit

// MARK: - Protocols

public protocol AuthenticationPresentationLogic {
    
}

// MARK: - AuthenticationViewController

final class AuthenticationViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: AuthenticationLogic
    
    // MARK: - UI
    
    private lazy var bottomButton: CommonBottomButton = {
        let button = CommonBottomButton()
        button.setTitle("Войти")
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        Constants.logoText.append(Constants.driveTextPart)
        label.attributedText = Constants.logoText
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageAsset.authIcon.image
        return imageView
    }()
    
    private lazy var logoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Init
    
    init(viewModel: AuthenticationLogic) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - AuthenticationViewLogic

extension AuthenticationViewController: AuthenticationPresentationLogic {
    
}

// MARK: - ViewConfigurable

extension AuthenticationViewController: ViewConfigurable {
    func setupViews() {
        view.backgroundColor = .white
        logoStack.addArrangedSubview(imageView)
        logoStack.addArrangedSubview(nameLabel)
        view.addSubview(logoStack)
        view.addSubview(bottomButton)
    }
    
    func setupConstraints() {
        logoStack.center(inView: view)
        bottomButton.anchor(
            bottom: view.bottomAnchor,
            paddingBottom: 56,
            width: 320,
            height: 50
        )
        bottomButton.centerXInView(view)
    }
}

// MARK: - Constants

private extension AuthenticationViewController {
    enum Constants {
        static let skillBoxText: String = "Skillbox"
        static let driveText: String = " Drive"
        static let skillBoxTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.graphikMedium(ofSize: 30)
        ]
        static let driveTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.graphikLight(ofSize: 30)
        ]
        static let logoText: NSMutableAttributedString = .init(string: skillBoxText, attributes: skillBoxTextAttributes)
        static let driveTextPart: NSAttributedString = .init(string: driveText, attributes: driveTextAttributes)
    }
}
