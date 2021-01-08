import Foundation

extension Int {
    func base(radix: Int) -> [Int] {
        var coefficients = [Int]()

        var quotient = self
        var remainder = 0

        while quotient > 0 {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: radix)
            coefficients.append(remainder)
        }

        return coefficients
    }

    func base(radix: Int, size: Int) -> [Int] {
        var base = self.base(radix: radix)

        while base.count < size {
            base.append(0)
        }

        return base
    }
}

extension Int {
    var factorialBase: [Int] {
        var coefficients = [Int]()

        var radix = 1
        var quotient = self
        var remainder = 0

        while quotient > 0 {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: radix)
            coefficients.append(remainder)

            radix += 1
        }

        return coefficients
    }

    func factorialBase(size: Int) -> [Int] {
        var factorialBase = self.factorialBase

        while factorialBase.count < size {
            factorialBase.append(0)
        }

        return factorialBase
    }
}
