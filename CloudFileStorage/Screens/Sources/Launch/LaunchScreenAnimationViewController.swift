//
//  LaunchScreenAnimationViewController.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 27.02.2024.
//

import Combine
import UIKit

protocol LaunchScreenCoordinationDelegate: Coordinator {
    func launchAuthentication()
}

final class LaunchScreenAnimationViewController: UIViewController {
    
    let viewModel: LaunchScreenLogic
    weak var coordinationDelegate: LaunchScreenCoordinationDelegate?
    private var eventsBag: Set<AnyCancellable> = []
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageAsset.authIcon.image
        return imageView
    }()
    
    // MARK: - Init
    
    init(viewModel: LaunchScreenLogic, coordinationDelegate: LaunchScreenCoordinationDelegate) {
        self.viewModel = viewModel
        self.coordinationDelegate = coordinationDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        imageView.pulseAndMoveUp()
        viewModel.startApplication()
    }
}

extension LaunchScreenAnimationViewController: ViewConfigurable {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.center(inView: view)
    }
    
    func bind() {
        viewModel.startAppEvent.sink { [weak self] event in
            switch event {
            case .onboarding:
                break
                
            case .authentication:
                self?.coordinationDelegate?.launchAuthentication()
            }
        }.store(in: &eventsBag)
    }
}

fileprivate extension UIView {
    /// Выполняет анимацию пульсации с последующим перемещением вверх по оси Y.
    func pulseAndMoveUp() {
        // Анимация пульсации
        UIView.animate(withDuration: 0.8, animations: {
            // Увеличение масштаба
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (finished) in
            UIView.animate(withDuration: 0.8, animations: {
                // Возврат к исходному масштабу
                self.transform = CGAffineTransform.identity
            }) { (finished) in
                // Анимация перемещения вверх после пульсации
                UIView.animate(withDuration: 0.4, animations: {
                    self.transform = CGAffineTransform(translationX: 0, y: -27)
                })
            }
        }
    }
}
