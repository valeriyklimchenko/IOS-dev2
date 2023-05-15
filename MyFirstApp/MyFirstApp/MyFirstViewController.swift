//
//  MyFirstViewController.swift
//  MyFirstApp
//
//  Created by Валерий Климченко on 05.04.2023.
//

import UIKit

class MyFirstViewController: UIViewController {

    private var myView: MyFirstXIB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = Bundle.main.loadNibNamed("MyFirstXIB", owner: nil, options: nil)?.first as? MyFirstXIB
        
        view.addSubview(myView)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        myView.frame = CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y,
            width: view.frame.width,
            height: 200
            )
            
    }



}
