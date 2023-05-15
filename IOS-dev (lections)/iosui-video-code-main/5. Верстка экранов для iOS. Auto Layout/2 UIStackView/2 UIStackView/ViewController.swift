//
//  ViewController.swift
//  2 UIStackView
//
//  Created by Валерий Климченко on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: private
    private lazy var bluView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(bluView)
        stackView.addArrangedSubview(redView)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        setupLayout()
    }

    private func setupLayout() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -16)
        ])
    }
    
}

