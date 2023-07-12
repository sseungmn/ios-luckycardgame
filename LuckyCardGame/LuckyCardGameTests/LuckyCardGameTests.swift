//
//  LuckyCardGameTests.swift
//  LuckyCardGameTests
//
//  Created by SEUNGMIN OH on 2023/07/12.
//

import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {

    var game: LuckyCardGame!
    var gameOption: LuckyCardGame.Option!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        game = nil
        gameOption = nil
    }

    func testInitiateGame_WhenPlayerNumberIs3() throws {
        // given
        gameOption = .init(playerCount: .three)

        // when
        game = LuckyCardGame(option: gameOption)

        // then
        XCTAssertEqual(gameOption.playerCount.dealerCardCount, 9)
        XCTAssertEqual(game.dealerDeck.cards.count, gameOption.playerCount.dealerCardCount)

        XCTAssertFalse(game.playersDeck.allSatisfy({ playerDeck in
            playerDeck.cards.contains(where: { card in
                card.description.suffix(2) == "12"
            })
        }))

        XCTAssertEqual(game.playersDeck.count, gameOption.playerCount.rawValue)
        XCTAssertEqual(gameOption.playerCount.playerCardCount, 8)

        XCTAssertEqual(game.playersDeck[0].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[1].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[2].cards.count, gameOption.playerCount.playerCardCount)
    }

    func testInitiateGame_WhenPlayerNumberIs4() throws {
        // given
        gameOption = .init(playerCount: .four)

        // when
        game = LuckyCardGame(option: gameOption)

        // then
        XCTAssertEqual(gameOption.playerCount.dealerCardCount, 8)
        XCTAssertEqual(game.dealerDeck.cards.count, gameOption.playerCount.dealerCardCount)

        XCTAssertEqual(game.playersDeck.count, gameOption.playerCount.rawValue)
        XCTAssertEqual(gameOption.playerCount.playerCardCount, 7)

        XCTAssertEqual(game.playersDeck[0].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[1].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[2].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[3].cards.count, gameOption.playerCount.playerCardCount)
    }

    func testInitiateGame_WhenPlayerNumberIs5() throws {
        // given
        gameOption = .init(playerCount: .five)

        // when
        game = LuckyCardGame(option: gameOption)

        // then
        XCTAssertEqual(gameOption.playerCount.dealerCardCount, 6)
        XCTAssertEqual(game.dealerDeck.cards.count, gameOption.playerCount.dealerCardCount)

        XCTAssertEqual(game.playersDeck.count, gameOption.playerCount.rawValue)
        XCTAssertEqual(gameOption.playerCount.playerCardCount, 6)

        XCTAssertEqual(game.playersDeck[0].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[1].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[2].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[3].cards.count, gameOption.playerCount.playerCardCount)
        XCTAssertEqual(game.playersDeck[4].cards.count, gameOption.playerCount.playerCardCount)
    }
}
