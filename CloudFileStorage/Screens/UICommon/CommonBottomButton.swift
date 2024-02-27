//
//  CommonBottomButton.swift
//  CloudFileStorage
//
//  Created by Dmitriy Grishechko on 26.02.2024.
//

import UIKit

// MARK: - CommonBottomButton

class CommonBottomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = .accent1 // Синий фон
        setTitleColor(.white, for: .normal) // Белый текст
        titleLabel?.font = UIFont.graphikMedium(ofSize: 16) // Размер шрифта
        layer.cornerRadius = 10 // Скругление углов
    }
    
    // Метод для установки текста кнопки
    func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
}

// MARK: - Button Press Animation

extension CommonBottomButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isPressed: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isPressed: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isPressed: false)
    }
    
    private func animate(isPressed: Bool) {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = isPressed ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
        })
    }
}
