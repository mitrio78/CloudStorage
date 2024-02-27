//
//  LaunchCoordinator.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import UIKit

protocol LaunchFlowDelegate: Coordinator {
    func finishLaunchFlow()
}

class LaunchCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var window: UIWindow?
    weak var flowDelegate: LaunchFlowDelegate?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let viewModel = LaunchScreenViewModel()
        let vc = LaunchScreenAnimationViewController(viewModel: viewModel, coordinationDelegate: self)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

extension LaunchCoordinator: LaunchScreenCoordinationDelegate {
    func launchAuthentication() {
        flowDelegate?.finishLaunchFlow()
    }
}
