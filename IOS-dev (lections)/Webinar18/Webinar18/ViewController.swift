//
//  ViewController.swift
//  Webinar18
//
//  Created by Bitec mini on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var btn: UIButton!
    
    

    override func viewDidLoad() {
        
        btn = UIButton(frame: .zero)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .orange
        btn.setTitle("Btn", for: .normal)
        
        view.addSubview(btn)
//
//        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: -100).isActive = true
        btn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0/5.0, constant: -50).isActive = true
        btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

