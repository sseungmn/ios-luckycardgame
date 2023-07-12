//
//  CardView.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/10.
//

import UIKit

final class CardView: LuckyCardGameBaseView {
    private let frontLayer = CALayer()
    private var frontCenterImageLayer = CALayer()
    private var frontLeftTopTextLayer = CALayer()
    private var frontRightBottomTextLayer = CALayer()

    private let backLayer = CALayer()
    private var backCenterImageLayer = CALayer()

    override func configureUI() {
        super.configureUI()

        backgroundColor = .white
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.addSublayer(frontLayer)
        layer.addSublayer(backLayer)

        frontLayer.addSublayer(frontCenterImageLayer)
        frontLayer.addSublayer(frontLeftTopTextLayer)
        frontLayer.addSublayer(frontRightBottomTextLayer)

        backLayer.addSublayer(backCenterImageLayer)
        backCenterImageLayer.contents = UIImage(named: "CardBackSideImage")?.cgImage

        backLayer.isHidden = true
    }

    override func configureLayout() {
        super.configureLayout()

        let contentFrame = bounds.applied(insets: Constant.Layout.cardInsets)
        frontLayer.frame = contentFrame
        backLayer.frame = contentFrame

        let centerImageOrigin = CGPoint(x: (contentFrame.size.width - Constant.Layout.cardImageSize.width) / 2, y: (contentFrame.size.height - Constant.Layout.cardImageSize.height) / 2)
        frontCenterImageLayer.frame.size = Constant.Layout.cardImageSize
        frontCenterImageLayer.frame.origin = centerImageOrigin
        frontLeftTopTextLayer.frame.origin = .zero
        frontRightBottomTextLayer.frame.origin = CGPoint(x: frontLayer.frame.width - frontRightBottomTextLayer.frame.width, y: frontLayer.frame.height - frontRightBottomTextLayer.frame.height)

        backCenterImageLayer.frame.size = Constant.Layout.cardImageSize
        backCenterImageLayer.frame.origin = centerImageOrigin
    }
}

// MARK: View API
extension CardView {
    func initCardFront(with card: CardProtocol) {
        if let frontCenterImage = String(card.description.prefix(1)).image(),
           let frontTextImage = String(card.description.suffix(2)).image() {
            frontCenterImageLayer.contents = frontCenterImage.cgImage
            frontCenterImageLayer.frame.size = frontCenterImage.size
            frontLeftTopTextLayer.contents = frontTextImage.cgImage
            frontLeftTopTextLayer.frame.size = frontTextImage.size
            frontRightBottomTextLayer.contents = frontTextImage.cgImage
            frontRightBottomTextLayer.frame.size = frontTextImage.size
        }
        if !card.isFront { flip() }
    }

    func flip() {
        frontLayer.isHidden.toggle()
        backLayer.isHidden.toggle()
    }
}
