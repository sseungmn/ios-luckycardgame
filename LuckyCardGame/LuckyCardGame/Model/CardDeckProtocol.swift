//
//  CardDeckProtocol.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

/*
 현재 상황에서 Card를 추상화하여 다양성을 구현하는 것 보다, CardDeck을 추상화 하는 것이 더 적절하다고 판단했습니다.
 이유는 다음과 같습니다.
 1. Card는 추후에 어떤 값 타입을 갖게될지 짐작할 수 없었습니다. 이 경우 미리 판단하여 대비하는 것은 낭비라고 생각했습니다.
 2. 그에 비해서 CardDeck은 Card가 달라지더라도 같은 API를 구현할 수 있습니다. 따라서 CardType에 따른 다형성을 구현하는것이 적절하다고 판단했습니다.
    모든 CardType에 대해 출력을 구현하기 위해서, 아주 가벼운 Card Protocol을 만들게 되었습니다.
 */
protocol CardDeckProtocol {
    associatedtype CardType: Card
    
    var cards: [CardType] { get }
}
