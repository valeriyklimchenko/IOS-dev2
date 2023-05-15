//
//  ViewController.swift
//  Webinar16
//
//  Created by Bitec mini on 17.04.2023.
//

import UIKit
import RealmSwift
import CoreData

struct ItemData: Decodable{
    var id: Int
    var title: String
    var completed: Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let child = LoadingViewController()
    var data = [ItemData]()
    var realm = try! Realm()
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        data.append(ItemData(id: 1, title: "hoho", completed: false))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        showIndicator()
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2){
//            self.hideIndicator()
//        }
        
        showIndicator()
        
        
        
        Task{
            do{
                let items = try await loadInitJson()
//                sleep(2)
                data = items
                tableView.reloadData()
                hideIndicator()
            }catch{
                print(error.localizedDescription)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func loadInitJson() async throws -> [ItemData]{
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        if (response as? HTTPURLResponse)?.statusCode == 200{
            return try JSONDecoder().decode([ItemData].self, from: data)
        }else{
            return []
        }
    }
    
    
    

}

extension ViewController{
    
    func showIndicator(){
        addChild(child)
        view.addSubview(child.view)
    
            
        self.child.view.frame = self.view.frame
    
        
        self.child.didMove(toParent: self)
       
    }
    
    func hideIndicator(){
        child.willMove(toParent: nil)
        
        self.child.view.frame = CGRect.zero
        
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    func saveDataCore(itemData: ItemData){
        let context = (( UIApplication.shared.connectedScenes.first as? UIWindowScene)?.delegate as? SceneDelegate)?.persistentContainer.viewContext
        if let context{
            let item = NSEntityDescription.insertNewObject(forEntityName: "CoreDataItem", into: context) as! CoreDataItem
            item.isCompleted = itemData.completed
            item.sTitle = itemData.title
            do {
                try context.save()
            }catch{
                print("couldn't save")
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
    
        let item = data[indexPath.row]
        content.text = item.title
        content.image = item.completed ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "xmark.octagon")
        
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        showIndicator()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            tableView.deselectRow(at: indexPath, animated: true)
        let item = data[indexPath.row]
        try! realm.write{
            realm.add(DbDataItem(title: item.title, isCompleted: item.completed))
        }
        saveDataCore(itemData: item)
//            self.hideIndicator()
//        }
        
    }
    
    
    
    
}



