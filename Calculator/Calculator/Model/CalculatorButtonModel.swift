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
    case addition
    case substraction
    case multiplication
    case division
    case equals
    
    var description: String {
        switch self {
        case .addition:
            return "➕"
        case .substraction:
            return "➖"
        case .multiplication:
            return "✖️"
        case .division:
            return "➗"
        case .equals:
            return "="
        }
    }
}

enum ClearState: CustomStringConvertible {
    case AC
    case C
    
    var description: String {
        switch self {
        case .AC:
            return "AC"
        case .C:
            return "C"
        }
    }
}

enum CalculatorModifier: CustomStringConvertible {
    case sign
    case comma
    case percent
    case clear(state: ClearState)
    
    var description: String {
        switch self {
        case .sign:
            return "+/-"
        case .comma:
            return ","
        case .percent:
            return "%"
        case .clear(let state):
            return state.description
        }
    }
}
