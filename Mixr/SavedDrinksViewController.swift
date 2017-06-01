//
//  SavedDrinksViewController
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

class SavedDrinksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var bartender: BartenderManager = BartenderManager.sharedInstance
    fileprivate var searchResults: [DrinkModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchResults = bartender.search(name: "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /* No-op */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell()
        let drink = searchResults[indexPath.row]
        c.textLabel?.text = drink.name
        return c
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

