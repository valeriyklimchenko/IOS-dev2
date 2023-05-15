//
//  ViewController.swift
//  basic ui
//
//  Created by Валерий Климченко on 04.05.2023.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let orangeView = Bundle.main.loadNibNamed(
            "View",
            owner: nil,
            options: nil
        )?.first as? UIView {
            orangeView.frame = CGRect(
                x: 100,
                y: 200,
                width: 200,
                height: 100
            )
            view.addSubview(orangeView)
        }
        
    }


}

