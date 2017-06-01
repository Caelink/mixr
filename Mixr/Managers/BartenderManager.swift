//
//  BartenderManager.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//


import UIKit

protocol CatalogueService {
    func search(by name: String, with payload:@escaping ([Recipe]) -> ())
}

class BartenderManager: NSObject {
    static let sharedInstance = BartenderManager()
    private var source: CatalogueService?
    private var drinks: [DrinkModel]?
    
    func search(name: String) -> [DrinkModel] {
        guard let drinks = self.drinks else {
            return []
        }
        
        guard name != "" else {
            return drinks
        }
        
        return drinks.filter({ (drink) -> Bool in
            return drink.name.lowercased().contains(name.lowercased())
        })
    }
    
    func search(ingredient: Ingredient) -> [DrinkModel] {
        guard let drinks = self.drinks else {
            return []
        }
        
        return drinks.filter({ (drink) -> Bool in
            return drink.ingredients.contains(ingredient)
        })
    }
    
    fileprivate override init() {
        super.init()
        self.source = AbsolutDrinkService()
        source?.search(by: "", with: { (drinks) in
            if let drinks = drinks as? [DrinkModel] {
                self.drinks = drinks
            }
        })
    }
}
