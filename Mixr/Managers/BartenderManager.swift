//
//  BartenderManager.swift
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-27.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//


import UIKit

class BartenderManager: NSObject {
    var savedDrink: DrinkModel?
    
    override init() {
        self.savedDrink = nil
    }
}

extension BartenderManager {
    func detailedDrinkInformationForDrink(_ drink: DrinkModel) -> DetailedDrinkModel? {
        return nil
    }
}
