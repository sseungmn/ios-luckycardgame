//
//  LayoutConstant.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

/// 관련된 View들에 공통된 Constant를 적용하기 위한 Protocol
protocol LayoutConstant {
    static var spacing: CGFloat { get }
    static var inset: CGFloat { get }
    static var cornerRadius: CGFloat { get }
}
