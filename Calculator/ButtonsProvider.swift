//
//  ButtonsProvider.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 29.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import Foundation

class ButtonsProvider {
    private let calculcator: Calculator
    
    init(calculcator: Calculator) {
        self.calculcator = calculcator
    }
    
    func operationResult(result: Double) {
        print(result)
    }
    
    func createButtonsModels() -> [[CalculatorButtonModel]] {
        return [firstRow(), secondRow(), thirdRow(), fourthRow(), fifthRow()]
    }
    
    private func firstRow() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let clear = CalculatorButtonModel(button: .modifier(.clear(state: .AC))) {
            self.calculcator.reset()
        }
        models.append(clear)
        
        let sign = CalculatorButtonModel(button: .modifier(.sign)) {
            self.calculcator.applyModifier(SignModifier())
        }
        models.append(sign)
        
        let percent = CalculatorButtonModel(button: .modifier(.percent)) {
            self.calculcator.applyModifier(PercentModifier())
        }
        models.append(percent)
        
        let division = CalculatorButtonModel(button: .operation(.division)) {
            self.calculcator.setCommand(DivisionCommand())
        }
        models.append(division)
        
        return models
    }
    
    private func secondRow() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let seven = CalculatorButtonModel(button: .number(value: 7)) {
            self.calculcator.setValue(7)
        }
        models.append(seven)
        
        let eight = CalculatorButtonModel(button: .number(value: 8)) {
            self.calculcator.setValue(8)
        }
        models.append(eight)
        
        let nine = CalculatorButtonModel(button: .number(value: 9)) {
            self.calculcator.setValue(9)
        }
        models.append(nine)
        
        let multiplication = CalculatorButtonModel(button: .operation(.multiplication)) {
            self.calculcator.setCommand(MultiplicationCommand())
        }
        models.append(multiplication)
        
        return models
    }
    
    private func thirdRow() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let four = CalculatorButtonModel(button: .number(value: 4)) {
            self.calculcator.setValue(4)
        }
        models.append(four)
        
        let five = CalculatorButtonModel(button: .number(value: 5)) {
            self.calculcator.setValue(5)
        }
        models.append(five)
        
        let six = CalculatorButtonModel(button: .number(value: 6)) {
            self.calculcator.setValue(6)
        }
        models.append(six)
        
        let substraction = CalculatorButtonModel(button: .operation(.substraction)) {
            self.calculcator.setCommand(SubtractionCommand())
        }
        models.append(substraction)
        
        return models
    }
    
    private func fourthRow() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let one = CalculatorButtonModel(button: .number(value: 1)) {
            self.calculcator.setValue(1)
        }
        models.append(one)
        
        let two = CalculatorButtonModel(button: .number(value: 2)) {
            self.calculcator.setValue(2)
        }
        models.append(two)
        
        let three = CalculatorButtonModel(button: .number(value: 3)) {
            self.calculcator.setValue(3)
        }
        models.append(three)
        
        let addition = CalculatorButtonModel(button: .operation(.addition)) {
            self.calculcator.setCommand(AdditionCommand())
        }
        models.append(addition)
        
        return models
    }
    
    private func fifthRow() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let zero = CalculatorButtonModel(button: .number(value: 0)) {
            self.calculcator.setValue(0)
        }
        models.append(zero)
        
        let comma = CalculatorButtonModel(button: .modifier(.comma)) {
            // TODO:
        }
        models.append(comma)

        let equals = CalculatorButtonModel(button: .operation(.equals)) {
            self.calculcator.calculate()
        }
        models.append(equals)
        
        return models
    }
}
