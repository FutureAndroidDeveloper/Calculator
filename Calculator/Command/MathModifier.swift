import Foundation

protocol MathModifier {
    func modify(value: Double) -> Double
}

struct SignModifier: MathModifier {
    func modify(value: Double) -> Double {
        var negatedValue = value
        negatedValue.negate()
        return negatedValue
    }
}

struct PercentModifier: MathModifier {
    func modify(value: Double) -> Double {
        return value / 100
    }
}
