//
//  BartenderManager.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

protocol CatalogueService {
    var knownDrinks: Observable<[DrinkModel]> { get }
}

class BartenderManager: NSObject {
    var source: CatalogueService?
    
}
