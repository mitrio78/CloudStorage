//
//  AuthenticationCoordinator.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    func start() {
        let viewModel = AuthenticationViewModel()
        let vc = AuthenticationViewController(viewModel: viewModel, coordinationDelegate: self)
        navigationController?.setViewControllers([vc], animated: true)
    }
}

extension AuthenticationCoordinator: AuthenticationCoordinationDelegate {
    func launchYandexLoginScreen() {
        let coordinator = YandexLoginCoordinator()
        coordinator.navigationController = navigationController
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
