//
//  DataContainer.swift
//  core_data_test
//
//  Created by Work on 2023/07/15.
//

import CoreData

class CoreDataStack {
    private let modelName: String

    init(modelName: String) {
        self.modelName = modelName
    }

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func getData()-> [NData] {
        let request: NSFetchRequest<NData> = NData.fetchRequest()
        do {
            return try managedContext.fetch(request)
        } catch {
            return [] //empty array in case it doesn't find anything
        }
    }

    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}


struct NDataViewModel: Equatable, Identifiable {
    let nData: NData
    
    var name: String {
        return nData.name ?? ""
    }
    
    var time: Date {
        return nData.time!
    }
    
    var id: NSManagedObjectID {
        return nData.objectID
    }
    
}
