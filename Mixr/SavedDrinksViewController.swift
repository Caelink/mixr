//
//  SavedDrinksViewController
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

class SavedDrinksViewController: UIViewController {
    var bartender: BartenderManager!
    
    //TODO remove
    lazy var someVariable: UIView = {
       return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(withBartender bartender: BartenderManager) {
        self.bartender = bartender
    }
}

