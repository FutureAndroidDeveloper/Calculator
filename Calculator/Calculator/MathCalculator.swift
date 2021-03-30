import Foundation

class MathCalculator: Calculator {
    private var firstValue: Double?
    private var secondValue: Double?
    private var command: MathCommand?
    
    private var textValue: String
    
    private var lastResult: Double?
    
    weak var delegate: CalculatorDelegate?
    
    
    var operationStack = [MathCommand]()
    var valueStack = [Double]()
    
    
    init() {
        textValue = String()
    }
    
    func calculate() {
        guard let lastEnteredValue = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        valueStack.append(lastEnteredValue)
        
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
        
//        guard let command = command,
//            let leftValue = firstValue,
//            let rightValue = secondValue else {
//                print("Cant perform calculate operation")
//                return
//        }
//        let result = command.execute(leftValue: leftValue, rightValue: rightValue)
//        delegate?.operationResult(result)
//        update(with: result)
    }
    
    func setValue(_ value: Int) {
        lastResult = nil
        updateValue("\(value)")
    }
    
    func setCommand(_ command: MathCommand) {
        
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
        
//        // если уже есть комманда, то вычисляем прошлый результат
//        if let _ = self.command {
//            calculate()
//            self.command = command
//            textValue = String()
//            return
//        }
//        self.command = command
//
//        if let first = firstValue {
//            secondValue = first
//        } else {
//            firstValue = Double(textValue)
//        }
//        textValue = String()
    }
    
    private var expression = String()
    
    private func buildExpression() -> String {
        return "HAHA"
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
//
//        if let _ = firstValue {
//            secondValue = newValue
//        }
        
        delegate?.currentValue(newValue)
        
        expression.append(value)
        delegate?.expression(expression)
        
//        delegate?.operationResult(newValue)
    }
    
    private func update(with result: Double) {
        firstValue = result
        secondValue = nil
        command = nil
    }
}
