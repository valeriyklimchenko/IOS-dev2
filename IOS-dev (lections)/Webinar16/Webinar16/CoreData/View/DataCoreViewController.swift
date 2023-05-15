//
//  DataCoreViewController.swift
//  Webinar16
//
//  Created by Bitec mini on 18.04.2023.
//

import UIKit
import CoreData

class DataCoreViewController: UITableViewController {
    
    var container: NSPersistentContainer!
    var dataSource = [CoreDataItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CoreCell")
    
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataCore()
        tableView.reloadData()
    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    
    
    func fetchDataCore(){
        
        let context = (( UIApplication.shared.connectedScenes.first as? UIWindowScene)?.delegate as? SceneDelegate)?.persistentContainer.viewContext
        if let context{
            do {
                try dataSource = context.fetch(CoreDataItem.fetchRequest())
            }catch{
                print("couldn't fetch")
            }
            
        }
        
        
//        let context = container.viewContext
//        if let context{
            
//        }
    }
    
    func deleteDataCore(item: CoreDataItem){
        let context = (( UIApplication.shared.connectedScenes.first as? UIWindowScene)?.delegate as? SceneDelegate)?.persistentContainer.viewContext
        if let context{
            do {
                context.delete(item)
                try context.save()
            }catch{
                
                print("couldn't delete")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let item = dataSource[indexPath.row]
        content.text = item.sTitle
        content.image = item.isCompleted ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "xmark.octagon")
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = dataSource[indexPath.row]
        
        deleteDataCore(item: item)
        dataSource.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
