//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by SEUNGMIN OH on 2023/07/05.
//

import Foundation

/*
 LuckyCard 타입 내부에 Nested enum으로 표현 한 이유는 다음과 같습니다.
 1. AnimalType, ValueType은 LuckyCard에 종속된 타입입니다.
    따라서 다른 곳에서 해당 타입을 사용할 때, `LuckyCard`라는 네임스페이스를 통해 접근하는 것이 직관적이라고 생각했습니다.
 2. enum으로 표현 한 이유는 선택할 수 있는 값에 제한을 두기 위해서입니다.
    ValueType의 경우에는 Int로만 선언하고 optional init으로 값을 제한할 수도 있겠지만, 선택의 폭을 명확하게 제시하는 것이 직관적이라고 판단했습니다.
    하지만 이럴 경우에는, ValueType의 제한이 달라졌을 때 대응하기 복잡하거나 귀찮을 수도 있다는 단점이 있습니다.

 LuckyCard를 추상클래스, 프로토콜의 구현체로 구현할 수도 있을 것 같습니다.
 하지만, 꼭 필요하지 않을 경우에 dynamism을 구현하는 것은 쓸데없는 비용을 지불하는 것이라는 이야기를 WWDC 15, Protocol Oriented Programming에서 들었고, 공감하기 때문에 구현하지 않았습니다.
 */

final class LuckyCard: CardProtocol {
    enum Animal: String, CaseIterable {
        case Dog = "\u{1F436}"
        case Cat = "\u{1F431}"
        case Cow = "\u{1F42E}"
    }

    enum Value: Int, CaseIterable {
        case one=1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
    }

    private let animal: Animal
    private let value: Value
    var isFront: Bool = false

    init(animal: Animal, value: Value) {
        self.animal = animal
        self.value = value
    }
}

extension LuckyCard: CustomStringConvertible {
    var description: String {
        return "\(animal.rawValue)" + String(format: "%02d", value.rawValue)
    }
}
