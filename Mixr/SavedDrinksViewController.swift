//
//  SavedDrinksViewController
//  Mixr
//
//  Created by Pivotal - Dev 133 on 2016-08-25.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

class SavedDrinksViewController: UIViewController {
    var bartender: BartenderManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(withBartender bartender: BartenderManager) {
        self.bartender = bartender
    }
}

