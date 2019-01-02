//
//  AnyTabCoordinator.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit

public protocol TabCoordinator {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var color: UIColor { get }
}

public class AnyTabCoordinator {
    var rootController: UIViewController
    var color: UIColor
    
    public init<T: TabCoordinator>(_ tabCoordinator: T) {
        rootController = tabCoordinator.rootController
        color = tabCoordinator.color
    }
}

public func deGenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator {
    return AnyTabCoordinator(coordinator)
}
