//
//  AppCoordinator.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let coordinator = LaunchCoordinator(window: window)
        childCoordinators.append(coordinator)
        coordinator.flowDelegate = self
        coordinator.start()
    }
}

extension AppCoordinator: LaunchFlowDelegate {
    func finishLaunchFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigationController = UINavigationController()
            self.window?.rootViewController = self.navigationController
            self.startAuthentication()
            
            UIView.transition(
                with: self.window!,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: nil,
                completion: nil
            )
            self.childCoordinators.removeAll()
        }
    }
}

private extension AppCoordinator {
    func startAuthentication() {
        let coordinator = AuthenticationCoordinator()
        coordinator.navigationController = navigationController
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
