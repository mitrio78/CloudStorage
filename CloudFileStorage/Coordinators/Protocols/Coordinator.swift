//
//  Coordinator.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    func start()
}
