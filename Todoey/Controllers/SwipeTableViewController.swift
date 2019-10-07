//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Kevin Smith on 10/4/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - TableView Datasurce Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         print("cellForRowAtIndexPathCalled - Category")
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
          
          //let category = categories[indexPath.row]
          
            
          
          cell.delegate = self
          //Ternary operator ==>
          // value = condition ? valueIfTrue : valueIfFalse
         // cell.accessoryType = item.done ? .checkmark : .none
          

          
          return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            self.updateModel(at: indexPath)
            
            print("Delete cell")
            
            //updating our Realm database

            
            
            
            
            print("Item deleted")
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }
    
    func updateModel(at IndexPath: IndexPath){
        //Update data model
     

        
        
    }
    
}


