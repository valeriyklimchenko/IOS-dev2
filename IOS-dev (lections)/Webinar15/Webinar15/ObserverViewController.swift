//
//  ObserverViewController.swift
//  Webinar15
//
//  Created by Bitec mini on 15.04.2023.
//

import UIKit


class Bloger{
    var counter = 0
    var lastVideo = ""
    
    private lazy var subscribers: [WeakSubcriber] = []
    
    func subscribe(_ subscriber: Subscriber){
        print("subscribed")
        subscribers.append(WeakSubcriber(value: subscriber))
    }
    
    func unsubscribe(_ subscriber: Subscriber){
        subscribers.removeAll(where: {$0.value === subscriber})
        print("unsubscribed")
    }
    
    func notify(){
        subscribers.forEach{
            $0.value?.update(subject: self)
        }
    }
    
    func releaseVideo(){
        counter += 1
        lastVideo = "video" + "\(counter)"
        notify()
    }
    
}

struct WeakSubcriber{
    weak var value: Subscriber?
}

protocol Subscriber: AnyObject{
    func update(subject: Bloger)
}


class ObserverViewController: UIViewController, Subscriber {
    
    let bloger = Bloger()
    

    @IBOutlet weak var lastInfoLabel: UILabel!
    @IBAction func publish(_ sender: Any) {
        bloger.releaseVideo()
    }
    @IBOutlet weak var publishByn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bloger.subscribe(self)
        // Do any additional setup after loading the view.
    }
    
    func update(subject: Bloger) {
        
        guard !subject.lastVideo.isEmpty else {return}
        
        if(subject.lastVideo.isEmpty){
            return
        }
        
        lastInfoLabel.text = subject.lastVideo
    }

    @IBAction func subscribe(_ sender: Any) {
        if(sender as AnyObject).isOn{
            bloger.subscribe(self)
        }else{
            bloger.unsubscribe(self)
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



