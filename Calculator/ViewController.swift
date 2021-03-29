//
//  ViewController.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 25.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator: CalculatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let buttons = (0...4).map { _ in
            createButtonsModels().map { CalculatorButton(model: $0) }
        }
        
        calculator = CalculatorView(buttons: buttons)
        setup()
    }
    
    private func setup() {
        view.addSubview(calculator)
        calculator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculator.topAnchor.constraint(equalTo: view.topAnchor),
            calculator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func createButtonsModels() -> [CalculatorButtonModel] {
        var models = [CalculatorButtonModel]()
        
        let number1 = CalculatorButtonModel(button: .number(value: 1)) {
            print("Tapped")
        }
        models.append(number1)
        
        let number2 = CalculatorButtonModel(button: .number(value: 2)) {
            print("Tapped")
        }
        models.append(number2)
        
        let modifier = CalculatorButtonModel(button: .modifier(.znak)) {
            print("Tapped")
        }
        models.append(modifier)
        
        let operation = CalculatorButtonModel(button: .operation(.minus)) {
            print("Tapped")
        }
        models.append(operation)
        
        return models
    }

}

