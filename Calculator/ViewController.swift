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

