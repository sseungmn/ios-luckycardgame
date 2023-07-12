//
//  CardGameProtocol.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/13.
//

import Foundation

protocol CardGameProtocol {
    associatedtype Option
    associatedtype CardDeck

    var dealerDeck: CardDeck { get }
    var playersDeck: [CardDeck] { get }

    init(option: Option)
}
