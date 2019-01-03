//
//  CircularTabBar.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit

class CircularTabBar: UIView, CircularTabViewDelegate {

    private let tabViews: [CircularTabView]
    private let radius: CGFloat
    private let main: UIView = UIView()
    private let mainButtonSide: CGFloat = 50
    private let onTabSelect: (Int) -> Void
    
    private var tabObjects = [TabObject]()
    private var isShowingTabs = false
    
    struct TabObject {
        let index: Int
        let view: CircularTabView
        let startPosition: CGPoint
        let finalPosition: CGPoint
    }

    init(frame: CGRect,
         tabViews: [CircularTabView],
         radius: CGFloat,
         onTabSelect: @escaping (Int) -> Void) {
        self.tabViews = tabViews
        self.radius = radius
        self.onTabSelect = onTabSelect
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addMainButton()
        positionTabs()
    }
    
    @objc func didTapMain() {
        isShowingTabs ? animateTabsOut() : animateTabsIn()
    }
    
    private func addMainButton() {
        main.frame = CGRect(x: 0, y: 0, width: mainButtonSide, height: mainButtonSide)
        main.layer.masksToBounds = true
        main.layer.cornerRadius = mainButtonSide/2
        main.backgroundColor = .black
        main.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapMain)))
        main.center = CGPoint(x: bounds.midX, y: frame.height/2)
        addSubview(main)
    }

    private func positionTabs() {
        for (i, tab) in tabViews.enumerated() {
            var angle = 0.0
            if i != 0 {
                angle = Double.pi / Double(tabViews.count-1) * Double(i)
            }
            let x = radius * -cos(CGFloat(angle))
            let y = radius * -sin(CGFloat(angle))
            //tab.center = CGPoint(x: x + bounds.midX, y: y + bounds.midY)
            tab.alpha = 0
            tab.delegate = self
            let startPosition = CGPoint(x: bounds.midX, y: frame.height/2)
            tabObjects.append(TabObject(index: i,
                                        view: tab,
                                        startPosition: startPosition,
                                        finalPosition: CGPoint(x: x + bounds.midX, y: y + bounds.midY)))
            tab.center = startPosition
            addSubview(tab)
        }
    }
    
    private func animateTabsOut() {
        let animDuration = 0.1
        for (i, tabObj) in tabObjects.enumerated() {
            UIView.animate(withDuration: animDuration,
                           delay: animDuration * Double(i),
                           options: [.curveLinear],
                           animations: {
                            tabObj.view.alpha = 0
                            tabObj.view.center = tabObj.startPosition
            }, completion: { finished in
                self.isShowingTabs = false
            })
        }
    }
    
    private func animateTabsIn() {
        let animDuration = 0.1
        for (i, tabObj) in tabObjects.enumerated() {
            UIView.animate(withDuration: animDuration,
                           delay: animDuration * Double(i),
                           options: [.curveLinear],
                           animations: {
                tabObj.view.alpha = 1
                tabObj.view.center = tabObj.finalPosition
            }, completion: { finished in
                self.isShowingTabs = true
            })
        }
    }
    
    func didSelectCircularTabView(index: Int) {
        onTabSelect(index)
    }
}
