//
//  ShakeVC.swift
//  TestFinal
//
//  Created by Shishkin Ivan Sergeevich on 05.03.2023.
//

import UIKit

final class ShakeVC: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите пароль"
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    // Функция для показа анимации подергивания
    private func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))

        textField.layer.add(animation, forKey: "position")
    }
    
    private func layout() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ShakeVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.isEmpty {
            shakeAnimation()
        }
        return true
    }
}

extension ShakeVC: CustomCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        print("ShakeVC delegate CustomCellDelegate")
    }
}
