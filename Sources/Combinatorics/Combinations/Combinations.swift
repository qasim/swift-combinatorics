import Foundation

public struct Combinations<ValueCollection: Collection> {
    public typealias Element = [ValueCollection.Element]

    public let count: Int

    private let values: ValueCollection
    private let length: Int
    private let withReplacement: Bool

    public init(_ values: ValueCollection, length: Int, withReplacement: Bool = false) {
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
            return combinationWithReplacement(at: index)
        } else {
            return combination(at: index)
        }
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
    private func combinationWithReplacement(at index: Int) -> Element {
        // TODO
        []
    }

    private func combination(at index: Int) -> Element {
        combinatorialNumbers(of: index, length: length).map { values[$0] }
    }
}

extension Combinations {
    private func combinatorialNumbers(of degree: Int, length: Int) -> [Int] {
        var numbers = [Int]()

        var currentDegree = degree
        var currentLength = length

        while numbers.count < length {
            var count = 0

            for numberOfValues in currentLength... {
                let nextCount = Self.count(numberOfValues: numberOfValues, length: currentLength)

                if nextCount > currentDegree {
                    currentDegree = currentDegree - count
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
