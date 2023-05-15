//
//  Feed.swift
//  MyFirstApp5
//
//  Created by Валерий Климченко on 10.04.2023.
//

import UIKit

class Feed: UIViewController {

    private var field: FieldView {
        
        let view = Bundle.main.loadNibNamed(
            "Field",
            owner: nil,
            options: nil
        )?.first as! FieldView
                
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        return view

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(field)
        
    }

}
