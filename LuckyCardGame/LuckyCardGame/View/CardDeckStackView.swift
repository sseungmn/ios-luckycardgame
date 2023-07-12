//
//  CardDeckStackView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/05.
//

import UIKit

final class CardDeckStackView: LuckyCardGameBaseView {
    var arrangedSubviews = [CardDeckView]()

    var spacing: CGFloat = 0

    override func configureLayout() {
        super.configureLayout()
        
        let contentFrame = bounds
        var origin = contentFrame.origin

        for i in arrangedSubviews.indices {
            let subView = arrangedSubviews[i]
            guard subView.isHidden == false else { continue }

            subView.frame = CGRect(origin: origin,
                                   size: Constant.Layout.cardDeckSize)
            subView.configureLayout()

            if i + 1 < arrangedSubviews.count {
                origin.y = subView.frame.maxY + Constant.Layout.spacing
            }
            frame.size.height = subView.frame.maxY
        }
    }
}

// MAKR: - View API
extension CardDeckStackView {
    func addArrangedSubView(_ subView: CardDeckView) {
        arrangedSubviews.append(subView)
        addSubview(subView)
    }
}
