import Foundation

precedencegroup Exponentiation {
  associativity: left
  higherThan: MultiplicationPrecedence
}

infix operator ** : Exponentiation

func ** (base: Int, power: Int) -> Int {
    return Int(pow(Double(base), Double(power)))
}
