//
//  Card.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

protocol CardProtocol: CustomStringConvertible, Comparable {
    var isFront: Bool { get set }
}
