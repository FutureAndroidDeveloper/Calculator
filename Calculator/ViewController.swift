//
//  ViewController.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 25.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var calculatorView: CalculatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView = CalculatorView()
        setup()
    }
    
    private func setup() {
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculatorView)
        NSLayoutConstraint.activate([
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.topAnchor.constraint(equalTo: view.topAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

