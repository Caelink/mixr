//
//  FirstViewController.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2016-10-23.
//  Copyright © 2016 Caelin Inc. All rights reserved.
//

import UIKit

enum EasyDrinks: String {
    case vodka = "Vodka"
}

class WelcomePageViewController: UIViewController {
    fileprivate lazy var welcomePageView: WelcomePageView = {
        return WelcomePageView(frame:self.view.frame)
    }()
    
    fileprivate lazy var bartender: BartenderManager = {
       return BartenderManager.sharedInstance
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(welcomePageView)
        welcomePageView.delegate = self
    }
}

extension WelcomePageViewController: WelcomePageViewDelegate {
    func loadTapped(by view: WelcomePageView) {
        bartender.search(by: EasyDrinks.vodka.rawValue) { drinks in
            print("Yay")
        }
    }
}
