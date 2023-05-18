//
//  CustumHeaderView.swift
//  UITbleView
//
//  Created by Валерий Климченко on 16.05.2023.
//

import UIKit

final class CustumHeaderView: UIView {
    
    private let textHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray2
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 50
        label.clipsToBounds = true
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupHeaderText(_ text: String) {
        textHeader.text = text
    }   
    
    private func layout() {
        addSubview(textHeader)
        let inset: CGFloat = 16
        NSLayoutConstraint.activate([
            textHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            textHeader.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            textHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            textHeader.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
    }
    
}

