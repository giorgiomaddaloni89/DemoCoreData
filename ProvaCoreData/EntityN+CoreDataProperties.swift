//
//  EntityN+CoreDataProperties.swift
//  ProvaCoreData
//
//  Created by Giorgio Maddaloni on 09/02/18.
//  Copyright © 2018 Giorgio Maddaloni. All rights reserved.
//
//

import Foundation
import CoreData


extension EntityN {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityN> {
        return NSFetchRequest<EntityN>(entityName: "EntityN")
    }

    @NSManaged public var chiavePrimaria: String?
    @NSManaged public var chiaveEsterna: NSSet?

}

// MARK: Generated accessors for chiaveEsterna
extension EntityN {

    @objc(addChiaveEsternaObject:)
    @NSManaged public func addToChiaveEsterna(_ value: Libro)

    @objc(removeChiaveEsternaObject:)
    @NSManaged public func removeFromChiaveEsterna(_ value: Libro)

    @objc(addChiaveEsterna:)
    @NSManaged public func addToChiaveEsterna(_ values: NSSet)

    @objc(removeChiaveEsterna:)
    @NSManaged public func removeFromChiaveEsterna(_ values: NSSet)

}
