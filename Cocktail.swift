//
//  Cocktail+CoreDataClass.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 13.06.2023.
//
//

import Foundation
import CoreData

@objc(Cocktail)
public class Cocktail: NSManagedObject {
    class func createInManagedObjectContext(_ context: NSManagedObjectContext, name: String, category: String, unit1: String, amount1: String, ingredient1: String, unit2: String, amount2: String, ingredient2: String, unit3: String, amount3: String, ingredient3: String, garnish: String, origin: String, preperation: String) -> Cocktail {
        let cocktailObject = NSEntityDescription.insertNewObject(forEntityName: "Cocktail", into: context) as! Cocktail
        cocktailObject.name = name
        cocktailObject.category = category
        cocktailObject.unit1 = unit1
        cocktailObject.amount1 = amount1
        cocktailObject.ingredient1 = ingredient1
        cocktailObject.unit2 = unit2
        cocktailObject.amount2 = amount2
        cocktailObject.ingredient2 = ingredient2
        cocktailObject.unit3 = unit3
        cocktailObject.amount3 = amount3
        cocktailObject.ingredient3 = ingredient3
        cocktailObject.garnish = garnish
        cocktailObject.origin = origin
        cocktailObject.preperation = preperation
        
        return cocktailObject
    }
}
