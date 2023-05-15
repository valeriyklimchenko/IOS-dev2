//
//  ViewController.swift
//  4 Rect
//
//  Created by Валерий Климченко on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: subviews
    private lazy var exempleView: ExampleView = {
        let view = ExampleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "exemple"
        view.addSubview(exempleView)
        view.backgroundColor = .systemBackground
        setupConstraints()
        
    }

    //MARK: private
    private func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            exempleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20
                                                ),
            exempleView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20
                                                 ),
            exempleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20
                                            ),
            exempleView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

}

