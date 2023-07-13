//
//  Card.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/06.
//

import Foundation

/*
 (7/13 추가)Card마다 숫자, 문양등 서로 다른 체계를 갖고 있을 것이다.
 그 체계를 내부적으로 변환하여 고유한 값을 만들 수 있을 것이다.
 그 값은 `value`를 통해 접근할 수 있다.
 */
protocol CardProtocol: CustomStringConvertible, Comparable {
    var isFront: Bool { get }
    var value: Int { get }
}
