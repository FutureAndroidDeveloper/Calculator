import Foundation

protocol MathCommand {
    var buttonType: CalculatorButtonType { get }
    init(buttonType: CalculatorButtonType)
    
    func execute(leftValue: Double, rightValue: Double) -> Double
}

extension MathCommand {
    init(buttonType: CalculatorButtonType) {
        self.init(buttonType: buttonType)
    }
}

struct AdditionCommand: MathCommand {
    var buttonType: CalculatorButtonType
    
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue + rightValue
    }
}

struct SubtractionCommand: MathCommand {
    var buttonType: CalculatorButtonType
    
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue - rightValue
    }
}

struct MultiplicationCommand: MathCommand {
    var buttonType: CalculatorButtonType
    
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue * rightValue
    }
}

struct DivisionCommand: MathCommand {
    var buttonType: CalculatorButtonType
    
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue / rightValue
    }
}
