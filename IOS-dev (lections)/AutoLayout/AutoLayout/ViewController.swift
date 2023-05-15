//
//  ViewController.swift
//  AutoLayout
//
//  Created by Ivan on 12.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var isPortraitOrientation: Bool {
        return UIDevice.current.orientation == .portrait
    }
    
    private var portraitLayout = [NSLayoutConstraint]()
    private var landscapeLayout = [NSLayoutConstraint]()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        isPortraitOrientation ? activatePortrait() : activateLandscape()
    }
    
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
        
        portraitLayout = [
            // redView
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            redView.heightAnchor.constraint(equalToConstant: 250),
            
            // blueView
            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20),
            blueView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        landscapeLayout = [
            // redView
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            redView.widthAnchor.constraint(equalToConstant: (view.frame.height / 2) - 60),
            redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            // blueView
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
    }
}

