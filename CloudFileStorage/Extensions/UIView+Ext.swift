//
//  UIView+Ext.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Размещает текущую вью по центру указанной вью с возможностью добавления смещения.
    /// - Parameters:
    ///   - view: Вью, относительно которой будет производиться центрирование.
    ///   - offsetX: Смещение по оси X относительно центра. По умолчанию равно 0.
    ///   - offsetY: Смещение по оси Y относительно центра. По умолчанию равно 0.
    func center(inView view: UIView, offsetX: CGFloat = 0, offsetY: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offsetX),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offsetY)
        ])
    }
    
    func centerXInView(_ containerView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if self.superview != containerView {
            containerView.addSubview(self)
        }
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    func centerYInView(_ containerView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if self.superview != containerView {
            containerView.addSubview(self)
        }
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
}

