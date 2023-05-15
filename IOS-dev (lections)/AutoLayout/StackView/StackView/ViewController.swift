//
//  ViewController.swift
//  StackView
//
//  Created by Валерий Климченко on 10.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private let redView: UIView = {
        $0.backgroundColor = .systemRed
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let blueView: UIView = {
        $0.backgroundColor = .systemBlue
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let stackView: UIStackView = {
        $0.backgroundColor = .systemGray4
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 20
        $0.alignment = .lastBaseline
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBlue
        $0.textColor = .white
        $0.text = "Label"
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        print(label.intrinsicContentSize.width)
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            self.stackView.removeArrangedSubview(self.redView)
//        }
    }

    private func layout() {
        view.addSubview(stackView)
        view.addSubview(label)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),

            redView.heightAnchor.constraint(equalToConstant: 100),
            blueView.heightAnchor.constraint(equalToConstant: 150)
        ])        
        stackView.setCustomSpacing(50, after: redView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            label.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width)
        ])
    }

}

