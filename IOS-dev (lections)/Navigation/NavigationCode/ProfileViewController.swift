//
//  ProfileViewController.swift
//  NavigationCode
//
//  Created by Nikita Demidov on 05/04/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // Устанавливем заголовок
        title = "Profile"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Создаем кнопку
        let button = UIButton(type: .system)
        
        // Настраиваем расположиние и размер
        button.frame = CGRect(origin: CGPoint(x: 30,y: 120), size: CGSize(width: 150,height: 30))
        
        // Настраиваем кнопку
        button.setTitle("Show details", for: .normal)
        button.backgroundColor = .green
        
        // Добавляем кнопку на ProfileViewController view
        view.addSubview(button)
        
        // Определем метод который будет вызываться по нажатию на кнопку
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }
    
     
    @objc func showDetails() {
        
        // Создаем detailsViewController
        let detailsViewController = DetailsInfoViewController()
        
        // Добавлем detailsViewController на navigationController
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

}
