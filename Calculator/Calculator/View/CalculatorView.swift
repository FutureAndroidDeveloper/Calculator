import UIKit

class CalculatorView: UIView, CalculatorDelegate {
    private var calcaulator: Calculator
    private var buttonsProvider: ButtonsProvider
    private let buttons: [[CalculatorButton]]
    
    private let resultLabel = UILabel()
    private let displayView = UIView()
    private let keyboard = UIStackView()
    
    private let butonsInRow = 4
    
    init() {
        calcaulator = MathCalculator()
        buttonsProvider = ButtonsProvider(calculcator: calcaulator)
        buttons = buttonsProvider.createButtonsModels().map { row in
            row.map { CalculatorButton(model: $0) }
        }
        super.init(frame: .zero)
        calcaulator.delegate = self
        setup()
        calcaulator.reset()
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
    
    func operationResult(_ result: Double) {
        resultLabel.text = "\(result)"
    }
    
    private func setup() {
        keyboard.axis = .vertical
        keyboard.distribution = .fill
        keyboard.spacing = 8
        keyboard.isLayoutMarginsRelativeArrangement = true
        keyboard.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        buttons.forEach {
            let row = createRow(for: $0)
            keyboard.addArrangedSubview(row)
        }
        
        // display
        displayView.backgroundColor = .lightGray
        displayView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(displayView)
        NSLayoutConstraint.activate([
            displayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            displayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            displayView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        displayView.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.centerYAnchor.constraint(equalTo: displayView.centerYAnchor),
            resultLabel.centerXAnchor.constraint(equalTo: displayView.centerXAnchor)
        ])
        
        
        // keyboard
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
        row.spacing = 8
        
        if buttons.count < butonsInRow {
             row.distribution = .fill
        } else {
            row.distribution = .fillEqually
        }
        
        return row
    }
}
