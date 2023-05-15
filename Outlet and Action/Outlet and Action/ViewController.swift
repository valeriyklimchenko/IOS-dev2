//
//  ViewController.swift
//  Outlet and Action
//
//  Created by Валерий Климченко on 10.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonTuched(_ sender: UIButton) {
        
        imageView.image = UIImage(named: "Closed")
        button.setTitle("Открыть", for: .normal)
        
    }
}

