//
//  YandexLoginCoordinator.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 28.02.2024.
//

import UIKit

class YandexLoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    func start() {
        let viewModel = YandexLoginViewModel()
        let vc = YandexLoginViewController(viewModel: viewModel)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        navigationController?.present(vc, animated: true)
    }
}
