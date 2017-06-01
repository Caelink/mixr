//
//  FirstViewController.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {
    fileprivate var drinks: [DrinkModel]?
    fileprivate lazy var welcomePageView: WelcomePageView = {
        return WelcomePageView(frame:self.view.frame)
    }()
    
    fileprivate var bartender: BartenderManager = BartenderManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(welcomePageView)
        welcomePageView.delegate = self
    }
}

extension WelcomePageViewController: WelcomePageViewDelegate {
    func loadTapped(by view: WelcomePageView) {
        drinks = bartender.search(ingredient: .Vodka)
    }
}
