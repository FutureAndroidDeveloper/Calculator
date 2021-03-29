//
//  CalculatorView.swift
//  Calculator
//
//  Created by Klimenkov, Kirill on 25.03.2021.
//  Copyright © 2021 Klimenkov, Kirill. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
    
    private let displayView: UIView
    private let keyboard: UIStackView
    private let buttons: [[CalculatorButton]]
    
    private let butonsInRow = 4
    
    init(buttons: [[CalculatorButton]]) {
        self.buttons = buttons
        displayView = UIView()
        keyboard = UIStackView()
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print()
        print(frame)
        print(bounds)
        
        
        let space = 8
        let spaceWidth = CGFloat((buttons.count + 1) * space)
        let buttonWidth = (frame.width - spaceWidth) / CGFloat(buttons.count)
        buttons.flatMap { $0 }.forEach {
            $0.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            $0.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        }
    }
    
    private func setup() {
        keyboard.axis = .vertical
        keyboard.distribution = .equalSpacing
        keyboard.spacing = 8
        
        buttons.forEach {
            let row = createRow(for: $0)
            keyboard.addArrangedSubview(row)
        }
        
        displayView.backgroundColor = .lightGray
        displayView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(displayView)
        NSLayoutConstraint.activate([
            displayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        keyboard.backgroundColor = .darkGray
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        addSubview(keyboard)
        NSLayoutConstraint.activate([
            keyboard.leadingAnchor.constraint(equalTo: leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: trailingAnchor),
            keyboard.topAnchor.constraint(equalTo: displayView.bottomAnchor),
            keyboard.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createRow(for buttons: [CalculatorButton]) -> UIStackView {
        let row = UIStackView(arrangedSubviews: buttons)
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 8
        
        row.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        row.isLayoutMarginsRelativeArrangement = true
        
        return row
    }
}
