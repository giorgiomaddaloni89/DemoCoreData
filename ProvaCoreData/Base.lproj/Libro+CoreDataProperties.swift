//
//  Libro+CoreDataProperties.swift
//  ProvaCoreData
//
//  Created by Giorgio Maddaloni on 07/02/18.
//  Copyright © 2018 Giorgio Maddaloni. All rights reserved.
//
//

import Foundation
import CoreData


extension Libro {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Libro> {
        return NSFetchRequest<Libro>(entityName: "Libro")
    }

    @NSManaged public var autore: String?
    @NSManaged public var nome: String?
    @NSManaged public var pagine: Int16
    @NSManaged public var pk: EntityN?
}
