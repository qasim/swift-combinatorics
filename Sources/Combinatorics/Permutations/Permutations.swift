import Foundation

public struct Permutations<C: Collection> {
    public typealias Element = [C.Element]

    public let count: Int

    private let values: C
    private let length: Int
    private let withReplacement: Bool

    public init(_ values: C, length: Int, withReplacement: Bool = false) {
        assert(length >= 0, "length must be non-negative")

        if !withReplacement {
            assert(length <= values.count, "length must be less than or equal to the number of values")
        }

        self.values = values
        self.length = length
        self.withReplacement = withReplacement

        if values.count > 0 && length > 0 {
            if withReplacement {
                self.count = Self.countWithReplacement(numberOfValues: values.count, length: length)
            } else {
                self.count = Self.count(numberOfValues: values.count, length: length)
            }
        } else {
            self.count = 0
        }
    }

    public subscript(_ index: Int) -> Element {
        if withReplacement {
            return permutationWithReplacement(at: index)
        } else {
            return permutation(at: index)
        }
    }
}

extension Permutations {
    private static func countWithReplacement(numberOfValues: Int, length: Int) -> Int {
        Int(pow(Double(numberOfValues), Double(length)))
    }

    private static func count(numberOfValues: Int, length: Int) -> Int {
        Int(numberOfValues.factorial / (numberOfValues - length).factorial)
    }
}

extension Permutations {
    private func permutationWithReplacement(at index: Int) -> Element {
        var indices: [C.Index] = []

        var quotient: Int = index
        var remainder: Int = 0

        while indices.count != length {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: values.count)
            indices.append(values.index(values.startIndex, offsetBy: remainder))
        }

        return indices.reversed().map { values[$0] }
    }

    private func permutation(at index: Int) -> Element {
        var permutation = Element()

        let stride = (values.count - length).factorial
        var indices = (index * stride).factoradic(values.count)
        var values = Array(self.values)

        while permutation.count < length {
            permutation.append(values.remove(at: indices.removeLast()))
        }

        return permutation
    }
}
