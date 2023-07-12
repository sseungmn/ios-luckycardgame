//
//  LuckyCardGame.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

struct LuckyCardGame {
    var dealerDeck = LuckyCardDeck()
    var playersDeck = [LuckyCardDeck]() // index == 0: 자신의 카드, index > 0: 다른 플레이어 카드

    mutating func initGame(playerNumber: Int) {
        playersDeck = [LuckyCardDeck](repeating: LuckyCardDeck(), count: playerNumber)
        dealerDeck.createShuffledCardDeck()

        var playerCardCount = 0, dealerCardCount = 0
        switch playerNumber {
        case 3: (playerCardCount, dealerCardCount) = (8, 9)
        case 4: (playerCardCount, dealerCardCount) = (7, 8)
        case 5: (playerCardCount, dealerCardCount) = (6, 6)
        default: fatalError("잘못된 플레이어 수 입니다.")
        }

        if playerNumber == 3 { dealerDeck.filterCard({ !$0.description.hasSuffix("12") })}
        for index in (0..<playerNumber) {
            guard let cards = dealerDeck.popCards(number: playerCardCount) else { fatalError("잘못된 카드 분배입니다.") }

            if index == 0 { cards.forEach { $0.isFront = true } }
            playersDeck[index].pushCards(cards)
        }
    }
}
