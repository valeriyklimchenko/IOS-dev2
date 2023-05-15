//
//  ViewControllerSV.swift
//  Webinar18
//
//  Created by Bitec mini on 05.05.2023.
//

import UIKit

class ViewControllerSV: UIViewController {
    
    var stackView: UIStackView!

    override func viewDidLoad() {
        
        stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        
        stackView.distribution = .fill
        
        
        stackView.backgroundColor = .orange
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let firstLabel = UILabel(frame: .zero)
        firstLabel.backgroundColor = .blue
        firstLabel.text = "Hello"
        let secondLabel = UILabel(frame: .zero)
        secondLabel.backgroundColor = .systemMint
        secondLabel.text = "World"
        let thirdLabel = UILabel(frame: .zero)
        thirdLabel.backgroundColor = .systemPink
        thirdLabel.text = "!"
//        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
