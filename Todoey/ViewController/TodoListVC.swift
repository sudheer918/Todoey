//
//  ViewController.swift
//  Todoey
//
//  Created by Sudheer Kumar on 1/10/18.
//  Copyright © 2018 Sudheer Kumar. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    let defaults = UserDefaults.standard
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            let newItem = Item()
            newItem.title = "Get Groceries"
            itemArray.append(newItem)
        
            let newItem2 = Item()
            newItem2.title = "Prepare for interview"
            itemArray.append(newItem2)
        
            let newItem3 = Item()
            newItem3.title = "Complete this course"
            itemArray.append(newItem3)
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemArray = items
        }
        }
        
    
    //MARK: - TableView Datasourse Methods.
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        let item = itemArray[indexPath.row]
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - TableView Delegate Methods.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        tableView.reloadData()
 
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
//     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            itemArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: indexPath, with: <#T##UITableViewRowAnimation#>)
//        }
//    }
    
    //MARK: - Add New Items
    
    @IBAction func addItemsToList(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "TODO LIST", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Items", style: .default) { (action) in
            let newItem = Item()
            
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
             self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item."
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true) {
            
        }
    }
  
}


