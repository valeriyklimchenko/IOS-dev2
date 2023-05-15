//
//  DetailsInfoViewController.swift
//  NavigationCode
//
//  Created by Nikita Demidov on 05/04/2023.
//

import UIKit

class DetailsInfoViewController: UIViewController {

    public var someInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Устанавливем заголовок
        title = "Details"
        
        
        // Добавляем label
        let label = UILabel(frame: CGRect(x: 30, y: 200, width: 200, height: 30))
        view.addSubview(label)

        // Устанавливаем текст который мы положили на предыдущем экране в поле someInfo
        label.text = someInfo
    }
}
