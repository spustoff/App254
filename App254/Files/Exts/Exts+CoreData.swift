//
//  Exts+CoreData.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()

    private init() {}

    var modelName: String = "" {
        
        didSet {
            
            persistentContainer = NSPersistentContainer(name: modelName)
            persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func updateIncome(forName name: String, withIncome income: Int16) {
//        
//        let context = persistentContainer.viewContext
//        
//        let fetchRequest: NSFetchRequest<ProjectsModel> = ProjectsModel.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
//        
//        do {
//            
//            let results = try context.fetch(fetchRequest)
//            
//            if let employeeToUpdate = results.first {
//                
//                employeeToUpdate.income = income
//                
//                try context.save()
//                
//            } else {
//                
//                print("No employee with name \(name) found")
//            }
//            
//        } catch let error as NSError {
//            
//            print("Unresolved error \(error), \(error.userInfo)")
//        }
//    }
}



