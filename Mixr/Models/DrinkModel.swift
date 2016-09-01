//
//  DrinkModel.swift
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-27.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

class DrinkModel: NSObject {
    let name: String
    let ingredients: Array<String>
    let partsPerIngredient: Dictionary<String, Int>
    
    init(name: String, ingredients: Array<String>, partsPerIngredient: Dictionary<String, Int>) {
        self.name = name
        self.ingredients = ingredients
        self.partsPerIngredient = partsPerIngredient
    }
}