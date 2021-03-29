import UIKit

class CalculatorButton: UIView {
    
    private let button = UIButton()
    
    private let model: CalculatorButtonModel
    
    init(model: CalculatorButtonModel) {
        self.model = model
        super.init(frame: .zero)
        setup()
        bind(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
    private func setup() {
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func bind(model: CalculatorButtonModel) {
        button.setTitle(model.symbol, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc
    private func handleButtonTap() {
        model.handler()
    }
}
