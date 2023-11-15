//
//  ProductsViewModel.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI
import CoreData

final class ProductsViewModel: ObservableObject {
    
    @Published var selectedForReport: ProductsModel?
    
    @Published var search_field: String = ""
    
    @Published var isSettings: Bool = false
    
    @Published var name: String = ""
    @Published var comment: String = ""
    @Published var number: String = ""
    @Published var price: String = ""
    @Published var pieces: String = ""
    
    @Published var products: [ProductsModel] = []
    
    func getFilteredProducts() -> [ProductsModel] {
        
        guard search_field.isEmpty else {
            
            return products.filter{($0.name ?? "").uppercased().contains(search_field.uppercased())}
        }
        
        return products
    }
    
    func fetchProducts() {
        
        CoreDataStack.shared.modelName = "ProductsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProductsModel>(entityName: "ProductsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.products = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.products = []
        }
    }
    
    func addProduct(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ProductsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "ProductsModel", into: context) as! ProductsModel
        
        trans.name = name
        trans.comment = comment
        trans.number = Int16(number) ?? 0
        trans.price = Int16(price) ?? 0
        trans.pieces = pieces
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
