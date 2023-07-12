//
//  LuckyCardDeck.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

/*
 LuckyCardDeck을 struct로 구현한 이유는 다음과 같습니다.
 1. class로 구현할 이유가 없다고 생각했습니다.
    class로 구현하는 경우는 꼭 필요한 경우에만 해야한다고 생각합니다.
    이번 경우에는 상속을 필요로 하지도 않고, 값 복사에 대한 디메리트도 없고, deinit을 필요로 하지 않기 때문에 class로 구현의 근거가 없습니다.
 */
struct LuckyCardDeck: CardDeckProtocol {
    typealias CardType = LuckyCard

    var cards: [LuckyCard] { _cards }
    private var _cards: [LuckyCard] = []

    mutating func createShuffledCardDeck() {
        _cards = LuckyCard.Animal.allCases.flatMap { animal in
            LuckyCard.Value.allCases.map { value in
                return LuckyCard(animal: animal, value: value)
            }
        }.shuffled()
    }

    mutating func filterCard(_ isIncluded: (LuckyCard) -> Bool) {
        _cards = _cards.filter(isIncluded)
    }

    mutating func popLastCard() -> LuckyCard? {
        return _cards.popLast()
    }

    mutating func popCards(number: Int) -> [LuckyCard]? {
        guard cards.count >= number else { return nil }
        var newCards = [LuckyCard]()
        for _ in 0..<number {
            guard let card = _cards.popLast() else { fatalError("Undefined behavior") }
            newCards.append(card)
        }
        return newCards
    }

    mutating func pushNewCard(_ card: LuckyCard) {
        _cards.append(card)
    }

    mutating func pushCards(_ cards: [LuckyCard]) {
        _cards.append(contentsOf: cards)
    }
}
