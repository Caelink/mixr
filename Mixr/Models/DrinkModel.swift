//
//  DrinkModel.swift
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-27.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

enum Ingredient: String {
    case Ice = "ice"
    case LemonJuice = "lemon juice"
    enum Alcohol : String {
        case Vodka = "vodka"
        case Tequila = "tequila"
        case TripleSec = "triple sec"
    }
}

protocol Recipe {
    var name: String { get }
    var ingredients: Array<Ingredient> { get }
    var partsPerIngredient: Dictionary<Ingredient, Int> { get }
    var extraInformation : String { get }
}


struct DrinkModel : Recipe {
    internal var name: String
    internal var ingredients: Array<Ingredient>
    internal var partsPerIngredient: Dictionary<Ingredient, Int>
    internal var extraInformation: String

    init(name: String,
         ingredients: Array<Ingredient>,
         partsPerIngredient: Dictionary<Ingredient, Int>,
         extraInformation: String) {
        self.name = name
        self.ingredients = ingredients
        self.partsPerIngredient = partsPerIngredient
        self.extraInformation = extraInformation
    }
}
