//
//  DisplayView.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 30.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import UIKit


class DisplayView: UIView {
    
    private let lastResultButton = UIButton()
    private let currentValueButton = UIButton()
    private let expressionLabel = UILabel()
    
    
    init() {
        super.init(frame: .zero)
        testUI()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setResult(_ result: String) {
        lastResultButton.setTitle(result, for: .normal)
    }
    
    func setCurrentValue(_ value: String) {
        currentValueButton.setTitle(value, for: .normal)
    }
    
    func setExpression(_ expression: String) {
        expressionLabel.text = expression
    }
    
    private func testUI() {
        lastResultButton.setTitle("1337", for: .normal)
        currentValueButton.setTitle("1999", for: .normal)
        expressionLabel.text = "22 + 30 = 10"
        expressionLabel.textAlignment = .right
    }
    
    private func setup() {
        lastResultButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lastResultButton)
        NSLayoutConstraint.activate([
            lastResultButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: lastResultButton.trailingAnchor, constant: 16)
        ])
        
        currentValueButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(currentValueButton)
        NSLayoutConstraint.activate([
            currentValueButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            currentValueButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            currentValueButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
        ])
        
        expressionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expressionLabel)
        NSLayoutConstraint.activate([
            expressionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            expressionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            expressionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
