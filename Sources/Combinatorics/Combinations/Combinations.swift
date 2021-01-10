import Foundation

public struct Combinations<ValueCollection: Collection> {
    private let values: ValueCollection
    private let length: Int
    private let withReplacement: Bool

    public let count: Int

    public init(_ values: ValueCollection, length: Int, withReplacement: Bool = false) {
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
        combinatorialNumbers(of: index).reversed().map { values[$0] }
    }
}

extension Combinations {
    static func countWithReplacement(numberOfValues: Int, length: Int) -> Int {
        (numberOfValues + length - 1).factorial / (length.factorial * (numberOfValues - 1).factorial)
    }

    static func count(numberOfValues: Int, length: Int) -> Int {
        numberOfValues.factorial / (length.factorial * (numberOfValues - length).factorial)
    }
}

extension Combinations {
    private func combinatorialNumbers(of degree: Int) -> [Int] {
        var numbers = [Int]()

        var currentDegree = degree
        var currentLength = length

        while numbers.count < length {
            var count = 0

            for numberOfValues in (withReplacement ? 1 : currentLength)... {
                let nextCount = withReplacement
                    ? Self.countWithReplacement(numberOfValues: numberOfValues, length: currentLength)
                    : Self.count(numberOfValues: numberOfValues, length: currentLength)

                if nextCount > currentDegree {
                    currentDegree -= count
                    currentLength -= 1
                    numbers.append(numberOfValues - 1)
                    break
                }

                count = nextCount
            }
        }

        return numbers
    }
}
