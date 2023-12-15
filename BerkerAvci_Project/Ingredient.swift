//
//  Ingredient.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 10.06.2023.
//

import Foundation

class Ingredient {
    var unit: String
    var amount: String
    var ingredient: String

    init(unit: String, amount: String, ingredient: String) {
        self.unit = unit
        self.amount = amount
        self.ingredient = ingredient
    }
}
