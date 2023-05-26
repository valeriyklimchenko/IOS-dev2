//
//  SecondViewController.swift
//  PatternDelegate
//
//  Created by Валерий Климченко on 26.05.2023.
//

import UIKit

class SecondViewController: UIViewController {

    weak var delegate: SecondVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidDisappear (_ animated: Bool) {
        self.delegate?.newTextLabel(text: "new text")
        print(ViewController().label.text as Any)
    }
}
