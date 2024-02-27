//
//  LaunchScreenViewModel.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import Combine
import UIKit

protocol LaunchScreenLogic {
    var startAppEvent: PassthroughSubject<LaunchScreenNavigationEventType, Never> { get }
    func startApplication()
}

enum LaunchScreenNavigationEventType {
    case onboarding
    case authentication
}

final class LaunchScreenViewModel {
    let startAppEvent = PassthroughSubject<LaunchScreenNavigationEventType, Never>()
}

extension LaunchScreenViewModel: LaunchScreenLogic {
    func startApplication() {
        // TODO: Add logic if first launch show onboarding else show auth, or quickStart
        startAppEvent.send(.authentication)
    }
}
