//
//  CardDeckView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/05.
//

import UIKit

final class CardDeckView: LuckyCardGameBaseView {
    private let caption: String

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNextCondensed-BoldItalic", size: 50)
        label.textColor = .systemGray.withAlphaComponent(0.5)
        return label
    }()

    private var spacing: CGFloat = 0

    private var cardViews = [CardView]()

    init(frame: CGRect, caption: String) {
        self.caption = caption

        super.init(frame: frame)
        configureUI()
    }

    convenience init(caption: String) {
        self.init(frame: .zero, caption: caption)
    }

    required init?(coder: NSCoder) {
        self.caption = ""
        
        super.init(coder: coder)
        configureUI()
    }

    override func configureUI() {
        super.configureUI()

        backgroundColor = .systemGray5
        layer.cornerRadius = Constant.View.cornerRadius

        captionLabel.text = caption

        addSubview(captionLabel)
    }

    override func configureLayout() {
        super.configureLayout()

        let contentFrame = bounds.applied(insets: Constant.Layout.cardDeckInsets)
        
        captionLabel.frame = CGRect(origin: contentFrame.origin,
                                    size: CGSize(width: 50, height: contentFrame.height))

        layoutCards()
    }

    private func layoutCards() {
        let contentFrame = bounds.applied(insets: Constant.Layout.cardDeckInsets)

        spacing = (contentFrame.width - Constant.Layout.cardSize.width * CGFloat(cardViews.count)) / (CGFloat(cardViews.count) - 1)

        var origin = contentFrame.origin
        for cardView in cardViews {
            guard cardView.isHidden == false else { continue }

            cardView.frame = CGRect(origin: origin, size: Constant.Layout.cardSize)
            cardView.configureLayout()

            origin.x += (Constant.Layout.cardSize.width + spacing)
        }
    }
}

// MARK: - View API
extension CardDeckView {
    func initCards(with cards: [LuckyCard]) {
        for card in cards {
            let cardView = CardView()
            cardView.initCardFront(with: card)
            cardViews.append(cardView)
            addSubview(cardView)
        }
        
        layoutCards()
    }
}
