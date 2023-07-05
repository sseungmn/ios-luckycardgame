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
    static let cardDeckIntrinsicHeight: CGFloat = 100

    static var safeAreaInsets = UIEdgeInsets() // dynamic
    static var contentInsets = UIEdgeInsets() // dynamic
    static var contentWidth: CGFloat = 0 // dynamic
}

final class GameBoardViewController: UIViewController {

    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()

    private let cardDeckListView: CardDeckStackView = {
        let cardDeckViews = CardDeckStackView()
        cardDeckViews.spacing = Constant.spacing
        cardDeckViews.backgroundColor = .systemBackground
        return cardDeckViews
    }()

    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = Constant.cornerRadius
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(cardDeckListView)
        view.addSubview(bottomView)
    }

    override func viewDidAppear(_ animated: Bool) {
        Constant.safeAreaInsets = view.safeAreaInsets
        Constant.contentInsets = UIEdgeInsets(top: view.safeAreaInsets.top + 15,
                                              left: view.safeAreaInsets.left + 20,
                                              bottom: view.safeAreaInsets.bottom + 15,
                                              right: view.safeAreaInsets.right + 20)
        Constant.contentWidth = UIScreen.main.bounds.width - Constant.contentInsets.left - Constant.contentInsets.right

        headerView.frame = CGRect(origin: CGPoint(x: Constant.contentInsets.left,
                                                  y: Constant.contentInsets.top),
                                  size: CGSize(width: Constant.contentWidth,
                                               height: 44))
        cardDeckListView.frame = CGRect(origin: CGPoint(x: Constant.contentInsets.left,
                                                        y: headerView.frame.origin.y + headerView.frame.height + Constant.spacing
                                                       ),
                                        size: CGSize(width: Constant.contentWidth, height: 0))

        for caption in ["A", "B", "C", "D", "E"] {
            let cardDeckView = CardDeckView(caption)
            cardDeckListView.addArrangedSubView(cardDeckView)
        }

        let bottomViewY = cardDeckListView.frame.origin.y + cardDeckListView.frame.height + Constant.spacing
        bottomView.frame = CGRect(origin: CGPoint(x: Constant.contentInsets.left,
                                                  y: bottomViewY),
                                  size: CGSize(width: Constant.contentWidth,
                                               height: UIScreen.main.bounds.height - Constant.contentInsets.bottom - bottomViewY))
    }
}

final class CardDeckStackView: UIView {

    private var cardDeckViews = [CardDeckView]()
    private var count: Int { cardDeckViews.count }

    var spacing: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addArrangedSubView(_ subView: CardDeckView) {
        var y: CGFloat = 0
        frame.size.height += Constant.cardDeckIntrinsicHeight

        if !cardDeckViews.isEmpty {
            frame.size.height += Constant.spacing
            y = cardDeckViews.last!.frame.origin.y + Constant.cardDeckIntrinsicHeight + spacing
        }

        subView.frame.origin = CGPoint(x: 0, y: y)

        cardDeckViews.append(subView)
        addSubview(subView)
    }
}

final class CardDeckView: UIView {
    private let caption: String

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNextCondensed-BoldItalic", size: 50)
        label.textColor = .systemGray.withAlphaComponent(0.5)
        return label
    }()

    init(_ frame: CGRect) {
        self.caption = ""

        super.init(frame: frame)
        configureUI()
    }

    init(_ caption: String) {
        self.caption = caption

        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .systemGray5
        layer.cornerRadius = Constant.cornerRadius
        frame.size = CGSize(width: Constant.contentWidth, height: Constant.cardDeckIntrinsicHeight)

        addSubview(captionLabel)
        captionLabel.text = caption
        captionLabel.frame = CGRect(origin: CGPoint(x: Constant.inset, y: 0),
                                    size: CGSize(width: 50,
                                         height: Constant.cardDeckIntrinsicHeight))
        captionLabel.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
