//
//  GameBoardViewController.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/04.
//

import UIKit

fileprivate enum Constant {
    static let spacing: CGFloat = 15
    static let inset: CGFloat = 15
    static let cornerRadius: CGFloat = 10
}

final class GameBoardViewController: UIViewController {

    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()

    private let cardDeckStackView: CardDeckStackView = {
        let cardDeckStackView = CardDeckStackView()
        cardDeckStackView.spacing = Constant.spacing
        cardDeckStackView.backgroundColor = .systemBackground
        return cardDeckStackView
    }()

    private let cardDeckViews = ["A", "B", "C", "E", "F"].map { CardDeckView($0) }

    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        layoutContents()
    }

    private func layoutContents() {
        view.addSubview(headerView)
        view.addSubview(cardDeckStackView)
        view.addSubview(bottomView)

        let contentInsets = UIEdgeInsets(top: view.safeAreaInsets.top + 15,
                                         left: view.safeAreaInsets.left + 20,
                                         bottom: view.safeAreaInsets.bottom + 15,
                                         right: view.safeAreaInsets.right + 20)
        let contentWidth = UIScreen.main.bounds.width - contentInsets.left - contentInsets.right
        let spacing: CGFloat = 15

        headerView.frame = CGRect(origin: CGPoint(x: contentInsets.left,
                                                  y: contentInsets.top),
                                  size: CGSize(width: contentWidth,
                                               height: 44))

        let cardDeckStackViewY = headerView.frame.maxY + spacing
        cardDeckStackView.frame = CGRect(origin: CGPoint(x: contentInsets.left, y: cardDeckStackViewY),
                                        size: CGSize(width: contentWidth, height: 0))


        cardDeckViews.forEach { cardDeckView in
            cardDeckView.bounds.size.width = contentWidth
            cardDeckStackView.addArrangedSubView(cardDeckView)
        }

        let bottomViewHeightMax: CGFloat = 200
        let bottomViewHeight = min(UIScreen.main.bounds.height - cardDeckStackView.frame.maxY - contentInsets.bottom - Constant.spacing, bottomViewHeightMax)
        let bottomViewY = UIScreen.main.bounds.height - contentInsets.bottom - bottomViewHeight
        bottomView.frame = CGRect(origin: CGPoint(x: contentInsets.left,
                                                  y: bottomViewY),
                                  size: CGSize(width: contentWidth,
                                               height: bottomViewHeight))
    }
}
