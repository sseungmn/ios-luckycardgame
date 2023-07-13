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
 2. (0712추가) 리뷰를 받아 다시 생각해 봤을 때, 대부분의 메서드가 내부 프로퍼티를 조작하는 mutating 메서드이기 때문에, class로 구현하는 것도 좋을 것 같다고 판단했다.
 */
class LuckyCardDeck: CardDeckProtocol {
    typealias CardType = LuckyCard
    
    private(set) var cards: [LuckyCard] = []
}

// MARK: Basic Feature
extension LuckyCardDeck {
    func sort(by areInIncreasingOrder: (LuckyCard, LuckyCard) -> Bool) {
        cards.sort(by: areInIncreasingOrder)
    }
    
    func filter(_ isIncluded: (LuckyCard) -> Bool) {
        cards = cards.filter(isIncluded)
    }
    
    func popLastCard() -> LuckyCard? {
        return cards.popLast()
    }
    
    func popCards(number: Int) -> [LuckyCard]? {
        guard cards.count >= number else { return nil }
        var newCards = [LuckyCard]()
        for _ in 0..<number {
            guard let card = cards.popLast() else { fatalError("Undefined behavior") }
            newCards.append(card)
        }
        return newCards
    }
    
    func push(newCard: LuckyCard) {
        cards.append(newCard)
    }
    
    func push(newCards: [LuckyCard]) {
        cards.append(contentsOf: newCards)
    }
}

// MARK: LuckyCardGame Feature
extension LuckyCardDeck {
    func createShuffledDeck() {
        cards = LuckyCard.Animal.allCases.flatMap { animal in
            LuckyCard.Number.allCases.map { number in
                return LuckyCard(animal: animal, number: number)
            }
        }.shuffled()
    }
}
