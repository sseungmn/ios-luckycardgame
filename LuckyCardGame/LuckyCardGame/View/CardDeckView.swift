//
//  CardDeckView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/05.
//

import UIKit

final class CardDeckView: UIView {
    private let intrinsicHeight: CGFloat = 100
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
        frame.size.height = intrinsicHeight
        backgroundColor = .systemGray5
        layer.cornerRadius = Constant.cornerRadius

        addSubview(captionLabel)
        captionLabel.text = caption
        captionLabel.frame = CGRect(origin: CGPoint(x: Constant.inset, y: 0),
                                    size: CGSize(width: 50, height: intrinsicHeight))
        captionLabel.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
