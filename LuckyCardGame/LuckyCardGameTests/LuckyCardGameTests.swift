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
    var playerCount: Int!

    override func setUpWithError() throws {
        game = LuckyCardGame()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func test_WhenPlayerNumberIs3() throws {
        // given
        playerCount = 3

        // when
        game.initGame(playerNumber: playerCount)

        // then
        XCTAssertEqual(game.dealerDeck.cards.count, 9)

        XCTAssertFalse(game.playersDeck.allSatisfy({ playerDeck in
            playerDeck.cards.contains(where: { card in
                card.description.suffix(2) == "12"
            })
        }))

        XCTAssertEqual(game.playersDeck.count, playerCount)
        XCTAssertEqual(game.playersDeck[0].cards.count, 8)
        XCTAssertEqual(game.playersDeck[1].cards.count, 8)
        XCTAssertEqual(game.playersDeck[2].cards.count, 8)

    }

    func testInitiateGame_WhenPlayerNumberIs4() throws {
        // given
        playerCount = 4

        // when
        game.initGame(playerNumber: playerCount)

        // then
        XCTAssertEqual(game.dealerDeck.cards.count, 8)

        XCTAssertEqual(game.playersDeck.count, playerCount)
        XCTAssertEqual(game.playersDeck[0].cards.count, 7)
        XCTAssertEqual(game.playersDeck[1].cards.count, 7)
        XCTAssertEqual(game.playersDeck[2].cards.count, 7)
        XCTAssertEqual(game.playersDeck[3].cards.count, 7)
    }

    func testInitiateGame_WhenPlayerNumberIs5() throws {
        // given
        playerCount = 5

        // when
        game.initGame(playerNumber: playerCount)

        XCTAssertEqual(game.dealerDeck.cards.count, 6)

        XCTAssertEqual(game.playersDeck.count, playerCount)
        XCTAssertEqual(game.playersDeck[0].cards.count, 6)
        XCTAssertEqual(game.playersDeck[1].cards.count, 6)
        XCTAssertEqual(game.playersDeck[2].cards.count, 6)
        XCTAssertEqual(game.playersDeck[3].cards.count, 6)
        XCTAssertEqual(game.playersDeck[4].cards.count, 6)
    }

}
