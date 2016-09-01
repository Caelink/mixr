//
//  AbsolutDrinkService.swift
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-31.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit
//import SwiftyJSON

//TODO make a constants file
let absolutName = "Caelin"
let absolutBaseURL = "http://addb.absolutdrinks.com/drinks"
let absolutAppID = "10049"
let absolutKey = "7c52101395ba4fe091bc40f1a6927951"
let absolutSecret = "f1770809e4be4dd8873400134f422f10"

class AbsolutDrinkService: NSObject {

    func searchForDrinksWithKeyword(keyword: String) -> Array<DrinkModel>? {
        
        return nil
    }
    
    
    func getInformationForDrinkName(drinkName: String) -> DetailedDrinkModel? {
        //Talk to the server for the app
        return nil
    }
}
