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
    private static func countWithReplacement(numberOfValues: Int, length: Int) -> Int {
        (numberOfValues + length - 1).factorial / (length.factorial * (numberOfValues - 1).factorial)
    }

    private static func count(numberOfValues: Int, length: Int) -> Int {
        numberOfValues.factorial / (length.factorial * (numberOfValues - length).factorial)
    }
}

extension Combinations {
    private func combinationWithReplacement(at index: Int) -> Element {
        []
    }

    private func combination(at index: Int) -> Element {
        []
    }
}
