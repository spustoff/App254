//
//  ShipmentsViewModel.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI
import CoreData

final class ShipmentsViewModel: ObservableObject {
    
    @Published var shipments: [ShipmentsModel] = []
    
    @Published var title: String = ""
    @Published var pieces: String = ""
    @Published var date: Date = Date()
    
    func fetchShipments() {
        
        CoreDataStack.shared.modelName = "ShipmentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ShipmentsModel>(entityName: "ShipmentsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.shipments = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.shipments = []
        }
    }
    
    func addShipment(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ShipmentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "ShipmentsModel", into: context) as! ShipmentsModel
        
        trans.title = title
        trans.date = date
        trans.pieces = pieces
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
