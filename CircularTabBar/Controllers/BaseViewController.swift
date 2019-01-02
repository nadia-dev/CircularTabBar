//
//  FirstViewController.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit
import Anchorage

class BaseViewController: UIViewController {
    var color: UIColor? {
        didSet {
            let overlay = UIView(frame: view.frame)
            overlay.backgroundColor = color?.withAlphaComponent(0.1)
            view.addSubview(overlay)
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
