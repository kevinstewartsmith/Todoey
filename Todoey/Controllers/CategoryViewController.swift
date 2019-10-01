//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Kevin Smith on 9/27/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [Category]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       loadCategories()

        
    }
    
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            print("cellForRowAtIndexPathCalled - Category")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: " CategoryCell", for: indexPath)
            
            let category = categories[indexPath.row]
            
            cell.textLabel?.text = category.name
            
            //Ternary operator ==>
            // value = condition ? valueIfTrue : valueIfFalse
           // cell.accessoryType = item.done ? .checkmark : .none
            

            
            return cell
        }
        

    
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    func saveCategories() {
        
        
        do {
           try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request : NSFetchRequest<Category> = Category.fetchRequest()){
        //let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading loading data from the context, \(error)")
        }
        
        tableView.reloadData()
    }

    
    
        
    //MARK: - Add New Categories
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
                
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
                
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
                    //what will happen when the user clicks the Add Item button on our UI Alert.
                    //print("Add Item Pressed")
                    //print(textField.text)
                    
                    
                    
            let newItem = Category(context: self.context)
            newItem.name = textField.text!
            
                    
        //            self.itemArray.append((textField.text!))
            self.categories.append(newItem)
                    
            self.saveCategories()
        }
                
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print(alertTextField.text)
            print("Now")
                    
        }
                
            alert.addAction(action)
                
            present(alert, animated: true, completion: nil)
    
    
    }
    
    
    
    

    
}
