//
//  DataSource.swift
//  TableViewMVC
//
//  Created by Syed Ali on 15/11/21.
//  Copyright © 2021 CTIS. All rights reserved.
//

import Foundation

class DataSource {
    var cocktails: [Cocktailss] = []
    var categories: [String] = []
    
    init() {
        print("Inside init()")
        
    }
    
    func numbeOfItemsInEachSection(_ index: Int) -> Int {
        return cocktailsInSection(index).count
    }
    
    func numberOfSections() -> Int {
        return categories.count
    }
    
    func getSectionLabelAtIndex(_ index: Int) -> String {
        return categories[index]
    }
    
    // MARK:- Populate Data from plist
    func populateData() {
        
        if let path = Bundle.main.path(forResource: "cocktails", ofType: "json") {
            if let jsonToParse = NSData(contentsOfFile: path) {
                
                // https://www.dotnetperls.com/guard-swift
                guard let json = try? JSON(data: jsonToParse as Data) else {
                    print("Error with JSON")
                    return
                }
                
                
                
                let total = json["cocktails"].count
                print(total)
                
                for index in 0..<total {
                    // Here we are not using if let for optionals
                    //let name = json["books"][index]["name"].string!
                    // OR (another simpler approach)
                    let name = json["cocktails", index, "name"].string!
                    let category = json["cocktails"][index]["category"].string!
                    //let ingredients = json["cocktails"][index]["ingredients"].string!
                    let ingredientsArray = json["cocktails"][index]["ingredients"].array
                        var ingredients: [Ingredient] = []
                        // Process the ingredients array
                        for ingredientjson in ingredientsArray ?? [] {
                            if let amountString = ingredientjson["amount"].string {
                                // Access each ingredient in the array
                                let unit = ingredientjson["unit"].string ?? ""
                                
                                let ingredient = ingredientjson["ingredient"].string!
                                let ingredientObj = Ingredient(unit: unit, amount: amountString, ingredient: ingredient)
                                ingredients.append(ingredientObj)
                            }
                            else if let amountFloat = ingredientjson["amount"].float {
                                let amount = String(amountFloat)
                                let unit = ingredientjson["unit"].string ?? ""
                                
                                let ingredient = ingredientjson["ingredient"].string!
                                let ingredientObj = Ingredient(unit: unit, amount: amount, ingredient: ingredient)
                                ingredients.append(ingredientObj)
                            }
                            
                            // Access and use other properties of the ingredient as needed
                        }
                    
                    
                    let garnish = json["cocktails"][index]["garnish"].string!
                    let preparation = json["cocktails"][index]["preparation"].string!
                    let image = json["cocktails"][index]["image"].string!
                    let origin = json["cocktails"][index]["origin"].string!
                    
                    
                    
                    
                    let cocktail = Cocktailss(name: name, category: category,ingredients: ingredients,garnish: garnish,preparation: preparation,image: image,origin: origin)
                    cocktails.append(cocktail)
                    print(name)
                    
                    if !categories.contains(category){
                        categories.append(category)
                    }
                    
                    
                    
                    // Using if let for multiple optionals in a single statement
                    /*print("\nBetter approach\n")
                    if let name = json["books"][index]["name"].string, let author = json["books"][index]["author"].string, let year = json["books"][index]["year"].string {
                        print(name)
                        print(author)
                        print(year)
                        print("\n")
                    }
                    else {
                        print("Error occurred during optional unwrapping")
                    }*/
                }
            }
            else {
                print("NSdata error")
            }
        }
        else {
            print("NSURL error")
        }
        
        
        
        
        
        
        
        /*if let path = Bundle.main.path(forResource: "cocktails", ofType: "json") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let group = dict["group"] as! String
                        
                        let fruit = Fruit(name: name, group: group)
                        fruits.append(fruit)
                        
                        if !sections.contains(group){
                            sections.append(group)
                        }
                        
                    }
                }
            }
        }
        print(sections)*/
    }
    
    // MARK:- FruitsForEachSection (filtering data based on section)
    func cocktailsInSection(_ index: Int) -> [Cocktailss] {
        //sections = ["Morning", "Afternoon", "Evening"]
        let item = categories[index]
        
        print()
        
        // See playground6 for Closure
        // https://www.appcoda.com/higher-order-functions-swift/
        let filteredCocktails = cocktails.filter { (cocktail: Cocktailss) -> Bool in
            return cocktail.category == item
        }
        
        return filteredCocktails
    }
    
}
