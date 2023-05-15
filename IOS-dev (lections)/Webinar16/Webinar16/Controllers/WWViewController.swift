//
//  WWViewController.swift
//  Webinar16
//
//  Created by Bitec mini on 18.04.2023.
//

import UIKit
import WebKit

class WWViewController: UIViewController, WKNavigationDelegate {

    
    let wv = WKWebView()
    
    let html = """
    <html>
    <body>
    <h1>Hello, World!</h1>
    </body>
    </html>
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wv.navigationDelegate = self
        
//        if let url = URL(string: "https://netology.ru/"){
//            let request = URLRequest(url: url)
//            self.wv.load(request)
//        }
        wv.loadHTMLString(html, baseURL: nil)
        wv.allowsBackForwardNavigationGestures = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = wv
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
