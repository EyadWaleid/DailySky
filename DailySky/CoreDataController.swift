//
//  Persistence.swift
//  DailySky
//
//  Created by Eyad waleed on 05/06/2026.
//

import CoreData

struct CoreDataController {
    

        static let shared = CoreDataController()

        let container: NSPersistentContainer

        var context: NSManagedObjectContext {
            container.viewContext
        }

        private init() {
            container = NSPersistentContainer(name: "DailySky") 
            container.loadPersistentStores { _, error in
                if let error {
                    fatalError("Core Data failed to load: \(error)")
                }
            }
        }

        func save() {
            guard context.hasChanges else { return }
            do {
                try context.save()
            } catch {
                print("Save error: \(error)")
            }
        }
    }


