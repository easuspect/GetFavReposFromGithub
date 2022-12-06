//
//  CoreDataManager.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 12/5/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer.init(name: "GetFavReposFromGithub")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    func insert(name: String) -> RepositoryManageObject {
        let newObject = RepositoryManageObject.init(context: container.viewContext)
        newObject.name = name
        
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
        return newObject
    }
    
    func fetch() -> [RepositoryManageObject] {
        let fetchRequest = NSFetchRequest<RepositoryManageObject>(entityName: "Repository")
  //      var result = [RepositoryManageObject]()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
            return []
        }
      //  return result
    }
}


