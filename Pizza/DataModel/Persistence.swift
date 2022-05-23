//
//  Persistence.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-08.
//

import CoreData
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Product")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
    //load the context
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    //function for saving context
    func saveContext() {
        do {
            try viewContext.save()
            print("Data has been saved")
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    //fetch pizza list from the data model
    func fetchPizza() -> [Pizza] {
        let request: NSFetchRequest<Pizza> = Pizza.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            let error = error as NSError
            print("An error occured: \(error)")
            return []
        }
    }
    
    //function for add pizza to the data model
    func addPizza(pizza: PizzaModel) {
        let item = Pizza(context: viewContext)
        item.id = UUID()
        item.name = pizza.name
        item.image = pizza.imageName
        item.ingredients = pizza.ingredients
        item.thumbnailName = pizza.thumbnailName
        item.type = pizza.type
        item.favorite = false
        item.timestamp = Date()
        
        saveContext()
    }
    
    //function for delete a pizza from data model
    func deletePizza(pizza: Pizza) {
        viewContext.delete(pizza)
        saveContext()
    }
}
