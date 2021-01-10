import Foundation

public struct Permutations<ValueCollection: Collection> {
    public typealias Element = [ValueCollection.Element]

    public let count: Int

    private let values: ValueCollection
    private let length: Int
    private let withReplacement: Bool

    public init(_ values: ValueCollection, length: Int? = nil, withReplacement: Bool = false) {
        let length = length ?? values.count

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
        index
            .base(radix: values.count, size: length)
            .reversed()
            .map { values[$0] }
    }

    private func permutation(at index: Int) -> Element {
        var permutation = Element()

        let stride = (values.count - length).factorial
        var indices = (index * stride).factorialBase(size: values.count)
        var values = Array(self.values)

        while permutation.count < length {
            permutation.append(values.remove(at: indices.removeLast()))
        }

        return permutation
    }
}
