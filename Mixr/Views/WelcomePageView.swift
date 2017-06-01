//
//  WelcomePageView.swift
//  Mixr
//
//  Created by Caelin Jackson-King on 2017-05-31.
//  Copyright © 2017 Caelin Inc. All rights reserved.
//

import UIKit

protocol WelcomePageViewDelegate: class {
    func loadTapped(by view: WelcomePageView)
}

class WelcomePageView: UIView {
    weak var delegate: WelcomePageViewDelegate?
    
    private var loadButton: UIButton = {
        let b = UIButton(frame:CGRect(x: 0, y: 0, width: 120, height: 80))
        b.setTitle("Hello World!", for: .normal)
        b.setTitleColor(.magenta, for: .normal)
        b.setTitleColor(.red, for: .highlighted)
        b.addTarget(self, action: #selector(WelcomePageView.loadButtonTapped), for: .touchUpInside)
        return b
    }()
    
    override func layoutSubviews() {
        loadButton.center = self.center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtonTapped() {
        delegate?.loadTapped(by: self)
    }
}
