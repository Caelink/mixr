//
//  BartenderManager.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//


import UIKit

protocol CatalogueService {
    func search(by name: String, with payload:@escaping ([DrinkModel]) -> ())
}

class BartenderManager: NSObject {
    static let sharedInstance = BartenderManager()
    private var source: CatalogueService?
    
    func search(by name: String, with payload: @escaping ([DrinkModel]) -> ()) {
        source?.search(by: name, with: payload)
    }
    
    fileprivate override init() {
        self.source = AbsolutDrinkService()
    }
}
