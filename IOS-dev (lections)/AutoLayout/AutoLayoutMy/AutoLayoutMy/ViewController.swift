//
//  ViewController.swift
//  AutoLayoutMy
//
//  Created by Валерий Климченко on 10.05.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: private
    private var isPortraitOrientation: Bool {
        UIDevice.current.orientation == .portrait
    }

    private var portraitLayout = [NSLayoutConstraint]()
    private var landscapeLayout = [NSLayoutConstraint]()

    private lazy var blueView: UIView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBlue
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(UIView())
    
    private lazy var redView: UIView = {
//        view.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .systemRed
        return view
    }()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        isPortraitOrientation ? activatePortrait() : activateLandscape()
    }
    
    
    //MARK: func
    private func activatePortrait() {
        NSLayoutConstraint.deactivate(landscapeLayout)
        NSLayoutConstraint.activate(portraitLayout)
    }
    
    private func activateLandscape() {
        NSLayoutConstraint.deactivate(portraitLayout)
        NSLayoutConstraint.activate(landscapeLayout)
    }
    
    private func layout() {
        view.addSubview(redView)
        view.addSubview(blueView)
        let safeArea = view.safeAreaLayoutGuide
            portraitLayout = [
            redView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            redView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            redView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            
            blueView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 16),
            blueView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
//            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
            blueView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ]
        landscapeLayout = [
            redView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            redView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            redView.heightAnchor.constraint(equalToConstant: view.frame.height / 2 - 48),
            
            blueView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 16),
            blueView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
//            blueView.heightAnchor.constraint(equalTo: redView.heightAnchor)
            blueView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ]
    }
    

}

