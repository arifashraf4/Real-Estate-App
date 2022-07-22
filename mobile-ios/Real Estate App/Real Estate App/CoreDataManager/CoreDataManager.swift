//
//  CoreDataManager.swift
//  Real Estate App
//
//  Created by arifashraf on 23/12/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "Real Estate App")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialise Core Data Stack \(error)")
            }
        }
    }
}
