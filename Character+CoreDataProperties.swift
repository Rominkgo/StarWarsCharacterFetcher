//
//  Character+CoreDataProperties.swift
//  StarWarsCharacterFetcher
//
//  Created by Default on 12/7/22.
//
//

import Foundation
import CoreData


extension SWCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SWCharacter> {
        return NSFetchRequest<SWCharacter>(entityName: "SWCharacter")
    }

    @NSManaged public var name: String
    @NSManaged public var eye_color: String?

}

extension SWCharacter : Identifiable {

}
