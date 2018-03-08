//
//  Libro+CoreDataClass.swift
//  ProvaCoreData
//
//  Created by Giorgio Maddaloni on 07/02/18.
//  Copyright © 2018 Giorgio Maddaloni. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Libro)
public class Libro: NSManagedObject {
    override init(entity: NSEntityDespription,insertInto context:NSManagedObjectContext?){
        super.init(entity:entity, insertInto: context)
    }
}
