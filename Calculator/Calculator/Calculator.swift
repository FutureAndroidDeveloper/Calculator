import Foundation

protocol Calculator {
    var delegate: CalculatorDelegate? { get set }
    
    func setValue(_ value: Double)
    func setCommand(_ command: MathCommand)
    func applyModifier(_ modifier: MathModifier)
    func calculate()
    func reset()
}

protocol CalculatorDelegate: class {
    func operationResult(_ result: Double)
    func currentValue(_ value: Double)
    func expression(_ expression: String)
}
