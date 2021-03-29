//
//  Calculator.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 29.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import Foundation


protocol CalculatorDelegate: class {
    func operationResult(_ result: Double)
}

class Calculator {
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
        firstValue = result
    }
    
    func setValue(_ value: Int) {
        textValue.append("\(value)")
        
        guard let newValue = Double(textValue) else {
            print("Cant convert text value to Double")
            return
        }
        
        if let _ = firstValue {
            secondValue = newValue
        }
        
        delegate?.operationResult(newValue)
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
        textValue = String()
        delegate?.operationResult(0)
    }
    
    private func update(with result: Double) {
        firstValue = result
        secondValue = nil
        command = nil
    }
}
