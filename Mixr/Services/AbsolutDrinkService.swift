//
//  AbsolutDrinkService.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

//TODO make a constants file and don't put this stuff in my public repo...
let absolutName = "Caelin"
let absolutBaseURL = "https://addb.absolutdrinks.com/drinks/"
let absolutAppID = "10049"
let absolutKey = "7c52101395ba4fe091bc40f1a6927951"
let absolutSecret = "f1770809e4be4dd8873400134f422f10"

extension DrinkModel {
    func modelFrom(absolutDictionary: [String : AnyObject]) -> DrinkModel {
        return DrinkModel.init(name: "",
                               ingredients: [],
                               partsPerIngredient: [:],
                               extraInformation: "")
    }
}

class AbsolutDrinkService: NSObject, CatalogueService {

    func searchForDrinksWithKeyword(_ keyword: String) {
        /* No-op for now - updates knownDrinks Observable */
    }
    
    func search(by name: String, with payload:@escaping ([DrinkModel]) -> ()) {
        //Talk to the server for the app
        let absolutKeyParameter = "?apiKey=" + absolutKey
        guard let drinkName = percentEscape(aString: name) else {
            print("unable to percent escape the given name")
            return
        }
        let urlString = absolutBaseURL + drinkName + absolutKeyParameter
        guard let url = URL(string: urlString) else {
            print("Error connecting to Absolut API")
            return
        }
        
        var request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        request.httpMethod = "GET"
        let session = URLSession(configuration: config)
        print("making request now")
        
        let task = session.dataTask(with: request,
                                    completionHandler: { [weak self] (data, response, error) in
                                        guard error == nil else {
                                            print("Error making request")
                                            payload([])
                                            return
                                        }
                                        
                                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                                            print("statusCode should be 200, but is \(httpStatus.statusCode)")
                                            print("response = \(String(describing: response))")
                                            payload([])
                                            return
                                        }
                                        
                                        guard let responseData = data else {
                                            print("No data returned")
                                            payload([])
                                            return
                                        }
                                        
                                        do {
                                            guard let drinkData = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                                                print("Error converting to json")
                                                payload([])
                                                return
                                            }
                                            if let drinks = self?.unpack(drinkData: drinkData) {
                                                payload(drinks)
                                            }
                                        } catch {
                                            print("Error converting to json")
                                            payload([])
                                        }
        })
        task.resume()
    }
}

//PRAGMA MARK: Helpers
extension AbsolutDrinkService {
    func percentEscape(aString: String) -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return aString.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }

    
    func unpack(drinkData:[String: AnyObject]) -> [DrinkModel] {
        var result : [DrinkModel]
        result = []
            guard let num = drinkData["totalResult"] as? [NSNumber],
                num != [(0)] else {
                return result
            }
        
        guard let drinks = drinkData["result"] as? [[String : AnyObject]] else {
            return result
        }
        
        for drink in drinks {
            if let drinkname = drink["name"] as? String {
                var ingredients : [Ingredient]
                if let ingredientDictionary = drink["ingredients"] as? [[String:AnyObject]] {
                    ingredients = parse(from:ingredientDictionary)
                } else {
                    ingredients = []
                }
                let newModel = DrinkModel.init(name:drinkname,
                                               ingredients: ingredients,
                                               partsPerIngredient: [:],
                                               extraInformation: "")
                result.append(newModel)
            }
        }
        
        return result
    }
    
    func parse(from ingredients: [[String:AnyObject]]) -> [Ingredient] {
        return []
    }
}
