//
//  BartenderManager.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//


import UIKit

protocol CatalogueService {
    func searchByName(name: String,
                      completion: @escaping (_ result: [DrinkModel]) -> Void)
}

class BartenderManager: NSObject {
    var lastSearch : [DrinkModel]
    
    init(catalogue: CatalogueService) {
        self.lastSearch = []
    }
}
