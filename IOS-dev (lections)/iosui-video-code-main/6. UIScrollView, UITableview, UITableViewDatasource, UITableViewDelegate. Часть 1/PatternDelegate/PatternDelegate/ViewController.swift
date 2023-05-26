//
//  ViewController.swift
//  PatternDelegate
//
//  Created by Валерий Климченко on 26.05.2023.
//

import UIKit

protocol SecondVCDelegate: AnyObject {
    func newTextLabel(text: String)
}

class ViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("go to SecondVC", for: .normal)
        button.addTarget(self, action: #selector(toSecondVCButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        layout()
    }

    private func layout() {
        [button, label].forEach {view.addSubview($0)}
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 15)
        ])
    }
    
    @objc func toSecondVCButtonPressed() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        present(secondVC, animated: true)
    }
    
}

extension ViewController: SecondVCDelegate {
    func newTextLabel(text: String) {
        label.text = text
    }
    
    
}
