//
//  StarWarsCoreDataRepository.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/7/22.
//

import Foundation
import CoreData

class StarWarsPersistenceService {
    
    static let shared = StarWarsPersistenceService()
    
    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StarWars")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save() {
        let context = persistenceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                 let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(starWarsCharacter character: StarWarsChars) {
        let sWCharacter = SWCharacter(context: persistenceContainer.viewContext)
        
        sWCharacter.name = character.name
        sWCharacter.eye_color = character.eye_color
    }
    
    
    func getSWCharacter() -> [SWCharacter]? {
        
        let request: NSFetchRequest<SWCharacter> = SWCharacter.fetchRequest()
        let result = try? persistenceContainer.viewContext.fetch(request)
        
        
        return result
    }
    
    
    
}
