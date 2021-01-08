import Foundation

extension Int {
    var factoradic: [Int] {
        var coefficients = [Int]()

        var radix = 1
        var quotient = self
        var remainder = 0

        while quotient != 0 {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: radix)
            coefficients.append(remainder)

            radix += 1
        }

        return coefficients
    }

    func factoradic(_ size: Int) -> [Int] {
        var factoradic = self.factoradic

        while factoradic.count < size {
            factoradic.append(0)
        }

        return factoradic
    }
}
