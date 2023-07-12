//
//  LuckyCardGameBaseView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/09.
//

import UIKit

class LuckyCardGameBaseView: UIView {
    enum Constant {
        enum Layout {
            static let spacing: CGFloat = 10
            static let insets: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
            static let cardDeckInsets: UIEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
            static var cardDeckSize: CGSize = .zero
            static let cardInsets: UIEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
            static var cardSize: CGSize = .zero
            static var cardImageSize: CGSize = .zero
        }
        enum View {
            static let cornerRadius: CGFloat = 10
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    func configureUI() {
        backgroundColor = .systemBackground
        layer.cornerRadius = Constant.View.cornerRadius
    }

    func configureLayout() { }
}
