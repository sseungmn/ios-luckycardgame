//
//  CGSize+UIEdgeInsets.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/09.
//

import UIKit

extension CGSize {
    func applied(insets: UIEdgeInsets) -> CGSize {
        var newSize = self
        newSize.apply(insets: insets)
        return newSize
    }

    mutating func apply(insets: UIEdgeInsets) {
        width -= insets.left + insets.right
        height -= insets.top + insets.bottom
    }
}
