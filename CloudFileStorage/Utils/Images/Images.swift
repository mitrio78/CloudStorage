//
//  Images.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import UIKit

import UIKit

enum ImageAsset: String {
    case authIcon = "authIcon"

    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}
