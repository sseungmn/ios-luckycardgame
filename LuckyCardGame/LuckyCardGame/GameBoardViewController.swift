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
        LuckyCardGame.Option.PlayerCount.allCases.forEach { playerCount in
            let option = LuckyCardGame.Option(playerCount: playerCount)
            let game = LuckyCardGame(option: option)
            games.append(game)
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
