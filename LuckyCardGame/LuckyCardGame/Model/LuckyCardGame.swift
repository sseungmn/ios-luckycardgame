//
//  LuckyCardGame.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

struct LuckyCardGame: CardGameProtocol {
    struct Option {
        var playerCount: PlayerCount

        enum PlayerCount: Int, CaseIterable {
            case three = 3
            case four = 4
            case five = 5

            var playerCardCount: Int {
                switch self {
                case .three: return 8
                case .four: return 7
                case .five: return 6
                }
            }

            var dealerCardCount: Int {
                switch self {
                case .three: return 9
                case .four: return 8
                case .five: return 6
                }
            }
        }
    }

    private(set) var dealerDeck = LuckyCardDeck()
    private(set) var playersDeck = [LuckyCardDeck]() // index == 0: 자신의 카드, index > 0: 다른 플레이어 카드

    init(option: Option) {
        for _ in 0..<option.playerCount.rawValue { playersDeck.append(LuckyCardDeck()) }
        dealerDeck.createShuffledCardDeck()

        if option.playerCount == .three { dealerDeck.filterCard({ !$0.description.hasSuffix("12") })}
        for index in 0..<option.playerCount.rawValue {
            guard let cards = dealerDeck.popCards(number: option.playerCount.playerCardCount) else { fatalError("잘못된 카드 분배입니다.") }

            if index == 0 { cards.forEach { $0.isFront = true } }
            playersDeck[index].pushCards(cards)
        }
    }
}
