//
//  GameFeatureTests.swift
//  LuckyCardGameTests
//
//  Created by SEUNGMIN OH on 2023/07/13.
//

import XCTest
@testable import LuckyCardGame

final class GameFeatureTests: XCTestCase {

    var game: LuckyCardGame!
    var gameOption: LuckyCardGame.Option!

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        game = nil
        gameOption = nil
    }

    func testSortingPlayerDeck_WhenRandomDeckWithThreePlayer() throws {
        // given
        gameOption = .init(playerCount: .three)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortPlayersDeck()

        // then
        for deck in game.playersDeck {
            let cards = deck.cards
            for leftIndex in 0..<cards.count - 1 {
                XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
            }
        }
    }

    func testSortingPlayerDeck_WhenRandomDeckWithFourPlayer() throws {
        // given
        gameOption = .init(playerCount: .four)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortPlayersDeck()

        // then
        for deck in game.playersDeck {
            let cards = deck.cards
            for leftIndex in 0..<cards.count - 1 {
                XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
            }
        }
    }

    func testSortingPlayerDeck_WhenRandomDeckWithFivePlayer() throws {
        // given
        gameOption = .init(playerCount: .five)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortPlayersDeck()

        // then
        for deck in game.playersDeck {
            let cards = deck.cards
            for leftIndex in 0..<cards.count - 1 {
                XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
            }
        }
    }

    func testSortingDealerDeck_WhenRandomDeckWithThreePlayer() throws {
        // given
        gameOption = .init(playerCount: .three)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortDealerDeck()

        // then
        let cards = game.dealerDeck.cards
        for leftIndex in 0..<cards.count - 1 {
            XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
        }
    }

    func testSortingDealerDeck_WhenRandomDeckWithFourPlayer() throws {
        // given
        gameOption = .init(playerCount: .four)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortDealerDeck()

        // then
        let cards = game.dealerDeck.cards
        for leftIndex in 0..<cards.count - 1 {
            XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
        }
    }

    func testSortingDealerDeck_WhenRandomDeckWithFivePlayer() throws {
        // given
        gameOption = .init(playerCount: .five)
        game = LuckyCardGame(option: gameOption)

        // when
        game.sortDealerDeck()

        // then
        let cards = game.dealerDeck.cards
        for leftIndex in 0..<cards.count - 1 {
            XCTAssertLessThanOrEqual(cards[leftIndex], cards[leftIndex+1])
        }
    }
}
