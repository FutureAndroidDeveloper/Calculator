import Foundation

class MathCalculator: Calculator {
    private var textValue: String
    private var expression: String
    private var lastResult: Double?
    
    private var operationStack = [MathCommand]()
    private var valueStack = [Double]()
    
    weak var delegate: CalculatorDelegate?
    
    
    init() {
        textValue = String()
        expression = String()
    }
    
    func calculate() {
        if let lastEnteredValue = Double(textValue) {
            // после результата продолжить ввод
            valueStack.append(lastEnteredValue)
        } else if let firstValue = valueStack.first {
            // 20 + = .... 20 + 20 = 40
            setValue(firstValue)
            valueStack.append(firstValue)
        } else {
            return
        }
                
        print()
        print(#function)
        var calculationStack = valueStack
        print("calculationStack = \(calculationStack)")
        
        for command in operationStack {
            print("current opperation = \(command.buttonType.symbol())")
            let values = calculationStack.prefix(2)
            calculationStack.removeFirst(2)
            print("values for operation = \(values)")
            
            if let left = values.first, let right = values.last {
                let result = command.execute(leftValue: left, rightValue: right)
                print("operation result = \(result)")
                calculationStack.insert(result, at: 0)
            }
        }
        
        
        if calculationStack.count == 1, let result = calculationStack.first {
            print("Конечный результат")
            delegate?.operationResult(result)
            delegate?.currentValue(result)
            
            expression.append(" = \(result)")
            delegate?.expression(expression)
            
            // отчистка стека после нажатия на равно + добавления выражения в историю
//            textValue = "\(result)"
            lastResult = result
            
            
            valueStack.removeAll()
            operationStack.removeAll()
            expression = String()
            textValue = String()
        }
    }
    
    func setValue(_ value: Double) {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false

        guard let number = formatter.string(from: value as NSNumber) else {
            print("Formatter problem!")
            return
        }
        
        lastResult = nil
        updateValue(number)
    }
    
    func setCommand(_ command: MathCommand) {
        if !operationStack.isEmpty {
            // TODO: - после просчета все обнулится, но это неправильно
            // после этого нужно обновить currentValue
//            calculate()
        }
        
        
        if let result = lastResult {
            expression.append("\(result)")
            textValue.append("\(result)")
            lastResult = nil
        }
        
        guard let value = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        
        valueStack.append(value)
        operationStack.append(command)
        textValue = String()
        
        expression.append(" \(command.buttonType.symbol()) ")
        delegate?.expression(expression)
    }
    
    func reset() {
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
        expression.append(value)
        guard let newValue = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        
        delegate?.currentValue(newValue)
        delegate?.expression(expression)
    }
    
}
