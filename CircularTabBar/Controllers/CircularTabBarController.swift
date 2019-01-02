//
//  CircularTabBarController.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit
import Anchorage

class CircularTabBarController: UITabBarController {
    
    var coordinator: AppCoordinator? {
        didSet {
            var tabs = [CircularTabView]()
            guard let coordinatorTabs = coordinator?.tabs else { return }
            
            for (i, tab) in coordinatorTabs.enumerated() {
                tabs.append(CircularTabView(side: 50, color: tab.color, index: i))
            }
            
            let onTabSelect: (Int) -> Void = { [unowned self] index in
                self.coordinator?.goToIndex(index)
            }
            
            let tabbar = CircularTabBar(frame: CGRect.zero,
                                        tabViews: tabs,
                                        radius: 100,
                                        onTabSelect: onTabSelect)
            view.addSubview(tabbar)
            tabbar.horizontalAnchors == view.horizontalAnchors
            tabbar.bottomAnchor == view.bottomAnchor
            tabbar.heightAnchor == 200
            tabbar.layoutIfNeeded()
            
            tabbar.setup()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
    }


}
