//
//  ViewConfigurable.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import Foundation

public protocol ViewConfigurable {
    func configure()
    func setupViews()
    func setupConstraints()
}

extension ViewConfigurable {
    func configure() {
        setupViews()
        setupConstraints()
    }
}
