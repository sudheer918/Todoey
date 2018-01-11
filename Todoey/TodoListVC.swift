//
//  ViewController.swift
//  Todoey
//
//  Created by Sudheer Kumar on 1/10/18.
//  Copyright © 2018 Sudheer Kumar. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    var itemArray = ["Get groceries", "Prepare for interview", "Finish the iOS Development course."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - TableView Datasourse Methods.
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - TableView Delegate Methods.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
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
            self.itemArray.append(textField.text!)
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

