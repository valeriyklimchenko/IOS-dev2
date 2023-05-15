//
//  TabBarViewController.swift
//  Webinar16
//
//  Created by Bitec mini on 18.04.2023.
//

import UIKit
import CoreData

class TabBarViewController: UITabBarController {
    
    var container: NSPersistentContainer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let nextVC = segue.destination as? DataCoreViewController {
               nextVC.container = container
           }
        if let nextVC = segue.destination as? ViewController {
            nextVC.container = container
        }
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
