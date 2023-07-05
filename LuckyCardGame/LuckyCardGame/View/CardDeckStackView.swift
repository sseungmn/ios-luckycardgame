//
//  CardDeckStackView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/05.
//

import UIKit

final class CardDeckStackView: UIView {

    private var count: Int { subviews.count }

    var spacing: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addArrangedSubView(_ subView: CardDeckView) {
        let y: CGFloat = count > 0 ? frame.size.height + spacing : 0

        subView.frame.origin = CGPoint(x: 0, y: y)
        frame.size.height = subView.frame.maxY

        addSubview(subView)
    }
}
