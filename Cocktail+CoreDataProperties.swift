//
//  Cocktail+CoreDataProperties.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 13.06.2023.
//
//

import Foundation
import CoreData


extension Cocktail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cocktail> {
        return NSFetchRequest<Cocktail>(entityName: "Cocktail")
    }

    @NSManaged public var amount1: String?
    @NSManaged public var amount2: String?
    @NSManaged public var amount3: String?
    @NSManaged public var category: String?
    @NSManaged public var garnish: String?
    @NSManaged public var ingredient1: String?
    @NSManaged public var ingredient2: String?
    @NSManaged public var ingredient3: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: String?
    @NSManaged public var preperation: String?
    @NSManaged public var unit1: String?
    @NSManaged public var unit2: String?
    @NSManaged public var unit3: String?

}

extension Cocktail : Identifiable {

}
