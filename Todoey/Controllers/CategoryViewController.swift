//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Kevin Smith on 9/27/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    

    var categories : Results<Category>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()

        
    }
    
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories?.count ?? 1
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            print("cellForRowAtIndexPathCalled - Category")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: " CategoryCell", for: indexPath)
            
            //let category = categories[indexPath.row]
            
            cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
            
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
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        
        
        do {
            try realm.write{
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(){
         categories = realm.objects(Category.self)
    }

    //MARK: - Add New Categories
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
                
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
                
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
                    //what will happen when the user clicks the Add Item button on our UI Alert.
                    //print("Add Item Pressed")
                    //print(textField.text)
                    
                    
                    
            let newCategory = Category()
            newCategory.name = textField.text!
            
                    
        //            self.itemArray.append((textField.text!))
        //    self.categories.append(newCategory)
                    
            self.save(category: newCategory)
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
