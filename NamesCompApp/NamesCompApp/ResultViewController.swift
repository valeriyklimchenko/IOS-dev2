//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Валерий Климченко on 03.04.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var ProgressView: UIProgressView!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NamesLabel: UILabel!
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NamesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
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
