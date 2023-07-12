//
//  GameBoardView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/08.
//

import UIKit

final class GameBoardView: LuckyCardGameBaseView {
    private let cardDeckStackView: CardDeckStackView = {
        let cardDeckStackView = CardDeckStackView()
        cardDeckStackView.spacing = Constant.Layout.spacing
        cardDeckStackView.backgroundColor = .systemBackground
        return cardDeckStackView
    }()

    private let cardDeckViews = [CardDeckView]()

    private let dealerCardDeckView: DealerCardDeckView = {
        let view = DealerCardDeckView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = Constant.View.cornerRadius
        return view
    }()

    override func configureUI() {
        super.configureUI()

        addSubview(cardDeckStackView)
        addSubview(dealerCardDeckView)
    }

    override func configureLayout() {
        super.configureLayout()

        let contentFrame = bounds
        var origin = contentFrame.origin

        // cardDeckStackView
        cardDeckStackView.frame = CGRect(origin: origin,
                                         size: CGSize(width: contentFrame.width, height: 0))
        cardDeckStackView.configureLayout()

        origin.y = cardDeckStackView.frame.maxY + Constant.Layout.spacing

        // dealerCardDeckView
        let dealerCardDeckViewHeight = min(Constant.Layout.cardDeckSize.height * 2 + Constant.Layout.spacing, contentFrame.maxY - origin.y)
        origin.y = contentFrame.maxY - dealerCardDeckViewHeight
        dealerCardDeckView.frame = CGRect(origin: origin,
                                          size: CGSize(width: contentFrame.width,
                                                       height: dealerCardDeckViewHeight))
        dealerCardDeckView.configureLayout()
    }

    
}

// MARK: - View API
extension GameBoardView {
    func initGameBoard(with luckyCardGame: LuckyCardGame) {
        let captions = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
        for i in luckyCardGame.playersDeck.indices {
            let playerDeck = luckyCardGame.playersDeck[i]

            let cardDeckView = CardDeckView(caption: captions[i])
            cardDeckView.initCards(with: playerDeck.cards)
            cardDeckStackView.addArrangedSubView(cardDeckView)
        }
        dealerCardDeckView.initCards(with: luckyCardGame.dealerDeck.cards)
    }
}
