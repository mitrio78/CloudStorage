//
//  Fonts.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import UIKit

extension UIFont {

    // Замените `YourFontName` на точное имя вашего шрифта
    static func graphikLight(ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Graphik-Light", size: size) else {
            fatalError("Failed to load the \"Graphik-Light\" font.")
        }
        return customFont
    }

    // Можете добавить дополнительные методы для разных вариантов вашего шрифта (жирный, курсив и т.д.)
    static func graphikMedium(ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Graphik-Medium", size: size) else {
            fatalError("Failed to load the \"Graphik-Medium\" font.")
        }
        return customFont
    }
}
