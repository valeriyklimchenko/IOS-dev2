//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Валерий Климченко on 02.04.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var PartnerNameTextField: UITextField!
    @IBOutlet weak var YourNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        
        destinationVC.firstName = YourNameTextField.text
        destinationVC.secondName = PartnerNameTextField.text
        
    }

    @IBAction func ResultButtonTupped() {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
}

