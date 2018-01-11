//
//  ViewController.swift
//  Todoey
//
//  Created by Sudheer Kumar on 1/10/18.
//  Copyright © 2018 Sudheer Kumar. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    let itemArray = ["Get groceries", "Prepare for interview", "Finish the iOS Development course."]
    
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
    
}

