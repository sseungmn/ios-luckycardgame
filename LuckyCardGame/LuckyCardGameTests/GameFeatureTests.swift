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

    // MARK: PlayerHasThreeSameCard
    func test_본인이3장의같은카드를갖고있을때_해당메서드가잘동작하나() {
        // given
        let playersDeck = [
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Cat, number: .one),
                LuckyCard(animal: .Cow, number: .one),
                LuckyCard(animal: .Dog, number: .one),
            ]),
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Cat, number: .two),
                LuckyCard(animal: .Cow, number: .three),
                LuckyCard(animal: .Dog, number: .four),
            ]),
        ]
        let dealerDeck = LuckyCardDeck(cards: [
            LuckyCard(animal: .Dog, number: .ten),
            LuckyCard(animal: .Cat, number: .eleven),
            LuckyCard(animal: .Cow, number: .ten),
        ])
        let sut = LuckyCardGame(playersDeck: playersDeck, dealerDeck: dealerDeck)

        // when
        let result = sut.checkPlayerHasThreeSameCard()

        // then
        XCTAssertTrue(result)
    }

    func test_딜러가3장의같은카드를갖고있을때_해당메서드가잘동작하나() {
        // given
        let playersDeck = [
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Dog, number: .ten),
                LuckyCard(animal: .Cat, number: .eleven),
                LuckyCard(animal: .Cow, number: .ten),
            ]),
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Cat, number: .two),
                LuckyCard(animal: .Cow, number: .three),
                LuckyCard(animal: .Dog, number: .four),
            ]),
        ]
        let dealerDeck = LuckyCardDeck(cards: [
            LuckyCard(animal: .Cat, number: .one),
            LuckyCard(animal: .Cow, number: .one),
            LuckyCard(animal: .Dog, number: .one),
        ])
        let sut = LuckyCardGame(playersDeck: playersDeck, dealerDeck: dealerDeck)

        // when
        let result = sut.checkPlayerHasThreeSameCard()

        // then
        XCTAssertFalse(result)
    }

    func test_아무도3장의같은카드를갖고있지않을때_해당메서드가잘동작하나() {
        // given
        let playersDeck = [
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Cat, number: .one),
                LuckyCard(animal: .Cow, number: .two),
                LuckyCard(animal: .Dog, number: .two),
            ]),
            LuckyCardDeck(cards: [
                LuckyCard(animal: .Cat, number: .two),
                LuckyCard(animal: .Cow, number: .three),
                LuckyCard(animal: .Dog, number: .four),
            ])
        ]
        let dealerDeck = LuckyCardDeck(cards: [
            LuckyCard(animal: .Dog, number: .two),
            LuckyCard(animal: .Cat, number: .twelve),
            LuckyCard(animal: .Cow, number: .ten),
        ])
        let sut = LuckyCardGame(playersDeck: playersDeck, dealerDeck: dealerDeck)

        // when
        let result = sut.checkPlayerHasThreeSameCard()

        // then
        XCTAssertFalse(result)
    }
}
