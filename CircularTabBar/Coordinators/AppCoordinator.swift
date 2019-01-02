//
//  AppCoordinator.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var tabBarController: CircularTabBarController
    var tabs: [AnyTabCoordinator]
    
    init(tabBarController: CircularTabBarController, tabs: [AnyTabCoordinator]) {
        self.tabBarController = tabBarController
        self.tabs = tabs
        self.tabBarController.coordinator = self
    }
    
    func start() {
        tabBarController.viewControllers = tabs.map { (coordinator) -> UIViewController in
            return coordinator.rootController
        }
    }
    
    func goToIndex(_ index: Int) {
        guard let fromView = tabBarController.selectedViewController?.view,
            let toView = tabBarController.viewControllers?[index].view else { return }
        if fromView != toView {
            UIView.transition(from: fromView,
                              to: toView,
                              duration: 0.3,
                              options: .transitionCurlUp) { finished in
                if finished {
                    self.tabBarController.selectedIndex = index
                }
            }
        }
    }
}
