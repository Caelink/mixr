//
//  AbsolutDrinkService.swift
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-31.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit
//import SwiftyJSON

//TODO make a constants file and don't put this stuff in my public repo...
let absolutName = "Caelin"
let absolutBaseURL = "http://addb.absolutdrinks.com/drinks/"
let absolutAppID = "10049"
let absolutKey = "7c52101395ba4fe091bc40f1a6927951"
let absolutSecret = "f1770809e4be4dd8873400134f422f10"


//I think this might need to be a class with singleton semantics :/
// Also I don't want to put this on master until I test it
struct AbsolutDrinkService: CatalogueService {

    func searchForDrinksWithKeyword(_ keyword: String) -> Array<DrinkModel>? {
        
        return nil
    }
    
    func searchByName(name: String,
                      completion: @escaping (_ result: [DrinkModel]) -> Void) {
        //Talk to the server for the app
        let urlString = absolutBaseURL + name
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            //parse the data somehow
            //call the callback
            completion([])
        }
    }
}
