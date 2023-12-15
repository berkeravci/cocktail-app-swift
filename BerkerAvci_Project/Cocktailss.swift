//
//  Cocktailss.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 13.06.2023.
//

import Foundation


class Cocktailss {
    var name:  String?
    var category: String?
    var ingredients: [Ingredient]
    var garnish: String?
    var preparation:  String?
    var image: String?
    var origin: String?
    
    
    init(name: String, category: String,ingredients: [Ingredient],garnish: String,preparation: String,image: String,origin: String) {
        self.name = name
        self.category = category
        self.ingredients = ingredients
        self.garnish = garnish
        self.preparation = preparation
        self.image = image
        self.origin = origin
    }
}
