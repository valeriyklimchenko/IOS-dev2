//
//  ViewController.swift
//  6 CALayer
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let orangeView: UIView = Bundle.main.loadNibNamed(
            "TestView",
            owner: nil,
            options: nil
        )?.first as? UIView {
            orangeView.frame = CGRect(
                x: 100,
                y: 200,
                width: 200,
                height: 100
            )
            
            orangeView.layer.cornerRadius = 20
            
            orangeView.layer.shadowColor = UIColor.systemGreen.cgColor
            orangeView.layer.shadowOffset = CGSize(width: 10, height: 10)
            orangeView.layer.shadowRadius = 5
            orangeView.layer.shadowOpacity = 1
            
            orangeView.layer.borderColor = UIColor.systemRed.cgColor
            orangeView.layer.borderWidth = 3
            
            orangeView.layer.contents = UIImage(named: "cat")?.cgImage
            orangeView.layer.contentsGravity = .resizeAspect
            orangeView.layer.masksToBounds = true
            
            orangeView.layer.backgroundColor = UIColor.systemYellow.cgColor
            orangeView.layer.opacity = 1
            
            let sublayer = CALayer()
            sublayer.backgroundColor = UIColor.black.cgColor
            sublayer.frame = CGRect(x: 30, y: 0, width: 50, height: 200)
            sublayer.shadowColor = UIColor.systemRed.cgColor
            sublayer.shadowOffset = CGSize(width: 10, height: 10)
            sublayer.shadowOpacity = 0.5
            sublayer.shadowRadius = 5
            
            orangeView.layer.addSublayer(sublayer)
            
            orangeView.clipsToBounds = true
            
            view.addSubview(orangeView)
            
        }
    }
}

