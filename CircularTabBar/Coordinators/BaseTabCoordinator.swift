//
//  FirstTabCoordinator.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit

class BaseTabCoordinator: TabCoordinator {
    var rootController: UIViewController
    var color: UIColor
    
    init(color: UIColor) {
        let vc = BaseViewController()
        rootController = vc
        vc.view.backgroundColor = .white
        self.color = color
        vc.color = color
    }
}
