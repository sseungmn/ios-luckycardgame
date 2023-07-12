//
//  CGRect+UIEdgeInsets.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/08.
//

import UIKit

extension CGRect {
    func applied(insets: UIEdgeInsets) -> CGRect {
        var newRect = self
        newRect.apply(insets: insets)
        return newRect
    }
    
    mutating func apply(insets: UIEdgeInsets) {
        origin.x += insets.left
        origin.y += insets.top
        size.apply(insets: insets)
    }
}
