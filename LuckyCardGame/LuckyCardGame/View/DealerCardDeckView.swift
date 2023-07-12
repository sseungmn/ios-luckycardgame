//
//  DealerCardDeckView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/09.
//

import UIKit

final class DealerCardDeckView: LuckyCardGameBaseView {
    private var cardViews = [CardView]()

    private var spacing: CGFloat = 0

    // 최대 높이 : CardDeckHeight * 2 + spacing
    override func configureLayout() {
        super.configureLayout()

        layoutCards()
    }

    private func layoutCards() {
        let contentFrame = bounds.applied(insets: Constant.Layout.cardDeckInsets)

        var countInRow = cardViews.count <= 6 ? cardViews.count : Int(ceil(Double(cardViews.count) / 2))
        spacing = (contentFrame.width - Constant.Layout.cardSize.width * CGFloat(countInRow)) / CGFloat(countInRow - 1)

        var index = 0
        var origin = contentFrame.origin
        while index < cardViews.count {
            let cardView = cardViews[index]
            guard cardView.isHidden == false else { continue }

            if index == countInRow {
                origin.x = contentFrame.minX
                origin.y = contentFrame.maxY - Constant.Layout.cardSize.height
            }
            cardView.frame = CGRect(origin: origin, size: Constant.Layout.cardSize)
            cardView.configureLayout()

            origin.x += (Constant.Layout.cardSize.width + spacing)
            index += 1
        }
    }
}

// MARK: - View API
extension DealerCardDeckView {
    func initCards(with cards: [LuckyCard]) {
        for card in cards {
            let cardView = CardView()
            cardView.initCardFront(with: card)
            cardViews.append(cardView)
            addSubview(cardView)
        }

//        layoutCards()
    }
}
