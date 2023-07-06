//
//  CustomHeader.swift
//  TestFinal
//
//  Created by Shishkin Ivan Sergeevich on 03.03.2023.
//

import UIKit

protocol CustomHeaderDelegate: AnyObject {
    func didTapImage(_ image: UIImage?, imageRect: CGRect)
}

final class CustomHeader: UIView {
    
    weak var delegate: CustomHeaderDelegate?
    
    var callBack: ((UIImage?, CGRect) -> Void)?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "image")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        addGesture()
        backgroundColor = .systemGray2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        //обращение к делегату для вызова единственной функции в протоколе
        delegate?.didTapImage(imageView.image, imageRect: imageView.frame)
        print("!23")
        callBack?(imageView.image, imageView.frame)
    }
    
    private func layout() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}
