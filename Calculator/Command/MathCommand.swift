//
//  MathCommand.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 29.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import Foundation

protocol MathCommand {
    func execute(leftValue: Double, rightValue: Double) -> Double
}

struct AdditionCommand: MathCommand {
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue + rightValue
    }
}

struct SubtractionCommand: MathCommand {
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue - rightValue
    }
}

struct MultiplicationCommand: MathCommand {
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue * rightValue
    }
}

struct DivisionCommand: MathCommand {
    func execute(leftValue: Double, rightValue: Double) -> Double {
        return leftValue / rightValue
    }
}
