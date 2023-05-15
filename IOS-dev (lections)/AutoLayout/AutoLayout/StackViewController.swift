//
//  StackViewController.swift
//  AutoLayout
//
//  Created by Ivan on 12.04.2023.
//

import UIKit

final class StackViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray4
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.alignment = .lastBaseline
        return stackView
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let blueView: UIView = {
        $0.backgroundColor = .blue
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название"
        label.backgroundColor = .darkGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        print(textLabel.intrinsicContentSize)
    }
    
    private func layout() {
        view.addSubview(stackView)
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            
            redView.heightAnchor.constraint(equalToConstant: 100),
            blueView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        
        stackView.setCustomSpacing(50, after: redView)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: textLabel.intrinsicContentSize.width)
        ])
    }
}
