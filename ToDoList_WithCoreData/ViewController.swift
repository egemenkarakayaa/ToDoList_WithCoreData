//
//  ViewController.swift
//  ToDoList_WithCoreData
//
//  Created by Egemen Karakaya on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    // Core Data Functions
    
    func getAllItems(){
      
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest())

        }
        catch {
            // error
        }
      
    }
    
    func createItem(name: String){
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
        }
        catch {
            // error
        }
    }
    
    func deleteItem(item: ToDoListItem){
        context.delete(item)
        
        do {
            try context.save()
        }
        catch {
            // error
        }
        
    }
    
    func updateItem(item: ToDoListItem, newName: String){
        item.name = newName
        
        do {
            try context.save()
        }
        catch {
            // error
        }
        
    }
    
    
    
    
}
