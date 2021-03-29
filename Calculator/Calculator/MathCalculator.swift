import Foundation

class MathCalculator: Calculator {
    private var firstValue: Double?
    private var secondValue: Double?
    private var command: MathCommand?
    
    private var textValue: String
    
    weak var delegate: CalculatorDelegate?
    
    init() {
        textValue = String()
    }
    
    func calculate() {
        guard let command = command,
            let leftValue = firstValue,
            let rightValue = secondValue else {
                print("Cant perform calculate operation")
                return
        }
        let result = command.execute(leftValue: leftValue, rightValue: rightValue)
        delegate?.operationResult(result)
        update(with: result)
    }
    
    func setValue(_ value: Int) {
        updateValue("\(value)")
    }
    
    func setCommand(_ command: MathCommand) {
        self.command = command
        
        if let first = firstValue {
            secondValue = first
        } else {
            firstValue = Double(textValue)
        }
        textValue = String()
    }
    
    func reset() {
        firstValue = nil
        secondValue = nil
        command = nil
        textValue = String()
        delegate?.operationResult(0)
    }
    
    func applyModifier(_ modifier: MathModifier) {
        guard let value = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        let newValue = modifier.modify(value: value)
        textValue = String()
        updateValue("\(newValue)")
    }
    
    private func updateValue(_ value: String) {
        textValue.append(value)
        
        guard let newValue = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        
        if let _ = firstValue {
            secondValue = newValue
        }
        
        delegate?.operationResult(newValue)
    }
    
    private func update(with result: Double) {
        firstValue = result
        secondValue = nil
        command = nil
    }
}
