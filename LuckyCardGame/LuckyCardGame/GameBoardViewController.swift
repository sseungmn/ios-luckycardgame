//
//  GameBoardViewController.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/04.
//

import UIKit

final class GameBoardViewController: UIViewController {
    var gameView: GameView {
        guard let view = view as? GameView else { return GameView(frame: .zero) }
        view.addTargetToSegmentedControl(self, #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return view
    }
    
    var games = [LuckyCardGame]()
    
    override func loadView() {
        super.loadView()
        view = GameView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        initGameAll()
    }
    
    func initGameAll() {
        [3, 4, 5].forEach { playerNumber in
            var game = LuckyCardGame()
            game.initGame(playerNumber: playerNumber)
            games.append(game)
            print("dealer(\(game.dealerDeck.cards.count)):", game.dealerDeck.cards.map { String(describing: $0) }.joined(separator: ", "))
            for i in 0..<playerNumber {
                print("player\(i)(\(game.playersDeck[i].cards.count)):", game.playersDeck[i].cards.map { String(describing: $0) }.joined(separator: ", "))
            }
        }
        gameView.initGame(with: games)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        gameView.configureLayout()
    }
}

extension GameBoardViewController {
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        gameView.selectGameBoard(sender.selectedSegmentIndex)
    }
}
