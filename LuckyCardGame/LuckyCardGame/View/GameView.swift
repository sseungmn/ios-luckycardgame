//
//  GameView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/11.
//

import UIKit

final class GameView: LuckyCardGameBaseView {
    private var currentGameBoardView: GameBoardView?

    private let playerNumberSegmentedControl: UISegmentedControl = {
        let items = ["3명", "4명", "5명"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    private var gameBoardViews = [GameBoardView]()

    override func configureUI() {
        super.configureUI()

        addSubview(playerNumberSegmentedControl)
    }

    override func configureLayout() {
        super.configureLayout()

        let contentFrame = bounds
            .applied(insets: safeAreaInsets)
            .applied(insets: Constant.Layout.insets)
        var origin = contentFrame.origin

        playerNumberSegmentedControl.frame = CGRect(origin: origin,
                                                    size: CGSize(width: contentFrame.width,
                                                                 height: playerNumberSegmentedControl.intrinsicContentSize.height))

        origin.y = playerNumberSegmentedControl.frame.maxY + Constant.Layout.spacing

        // GameBoardView 크기를 기반으로 CardDeckSize, CardSize를 계산
        Constant.Layout.cardDeckSize = CGSize(width: contentFrame.width,
                                              height: (contentFrame.maxY - origin.y - Constant.Layout.spacing * 5) / 6)

        let cardDeckContentSize = Constant.Layout.cardDeckSize.applied(insets: Constant.Layout.cardDeckInsets)
        Constant.Layout.cardSize = CGSize(width: cardDeckContentSize.width / 6, height: cardDeckContentSize.height)

        let cardContentSize = Constant.Layout.cardSize.applied(insets: Constant.Layout.cardInsets)
        Constant.Layout.cardImageSize = CGSize(width: cardContentSize.width / 3, height: cardContentSize.width / 3)

        for gameBoardView in gameBoardViews {
            gameBoardView.frame = CGRect(origin: origin,
                                         size: CGSize(width: contentFrame.width,
                                                      height: contentFrame.maxY - origin.y)
            )
            gameBoardView.configureLayout()
        }
    }

    private func initLayout() {
    }
}

// MARK: - AddTarget
extension GameView {
    func addTargetToSegmentedControl(_ target: Any, _ selector: Selector, for controlEvent: UIControl.Event) {
        playerNumberSegmentedControl.addTarget(target, action: selector, for: controlEvent)
    }
}

// MARK: API
extension GameView {
    func initGame(with games: [LuckyCardGame]) {
        for game in games {
            let gameBoardView = GameBoardView(frame: .zero)
            gameBoardView.isHidden = true
            gameBoardView.initGameBoard(with: game)
            gameBoardViews.append(gameBoardView)
            addSubview(gameBoardView)
        }
        selectGameBoard(0)
    }

    func selectGameBoard(_ index: Int) {
        currentGameBoardView?.isHidden = true
        currentGameBoardView = gameBoardViews[index]
        currentGameBoardView?.isHidden = false
    }
}
