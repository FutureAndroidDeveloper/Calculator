//
//  CalculatorButtonModel.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 25.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import Foundation


class CalculatorButtonModel {
    let symbol: String
    var handler: () -> Void
    
    init(button: CalculatorButtonType, handler: @escaping () -> Void) {
        symbol = button.symbol()
        self.handler = handler
    }
}


enum CalculatorButtonType {
    case number(value: Int)
    case modifier(_ modifier: CalculatorModifier)
    case operation(_ operation: CalculatorOperation)
    
    func symbol() -> String {
        switch self {
        case .number(let value):
            return "\(value)"
        case .modifier(let modifier):
            return modifier.description
        case .operation(let operation):
            return operation.description
        }
    }
}

enum CalculatorOperation: CustomStringConvertible {
    case plus
    case minus
    
    var description: String {
        switch self {
        case .minus:
            return "-"
        case .plus:
            return "+"
        }
    }
}

enum CalculatorModifier: CustomStringConvertible {
    case znak
    case comma
    
    var description: String {
        switch self {
        case .comma:
            return ","
        case .znak:
            return "+/-"
        }
    }
}
