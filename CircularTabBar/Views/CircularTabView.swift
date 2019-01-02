//
//  CircularTabView.swift
//  CircularTabBar
//
//  Created by Nadia Yudina on 1/2/19.
//  Copyright © 2019 Nadia Yudina. All rights reserved.
//

import UIKit

protocol CircularTabViewDelegate: class {
    func didSelectCircularTabView(index: Int)
}

class CircularTabView: UIView {
    
    weak var delegate: CircularTabViewDelegate?
    private var index: Int = 0
    
    convenience init(side: CGFloat, color: UIColor, index: Int) {
        self.init(frame: CGRect(x: 0, y: 0, width: side, height: side), color: color)
        self.index = index
        layer.cornerRadius = side/2
        layer.masksToBounds = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    @objc func didTapView() {
        delegate?.didSelectCircularTabView(index: index)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
