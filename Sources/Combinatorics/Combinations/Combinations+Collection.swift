import Foundation

extension Combinations: Collection {
    public var startIndex: Int {
        0
    }

    public var endIndex: Int {
        count
    }

    public func index(after i: Int) -> Int {
        i + 1
    }

    public func makeIterator() -> CombinationsIterator<ValueCollection> {
        CombinationsIterator(self)
    }
}

public struct CombinationsIterator<ValueCollection: Collection>: IteratorProtocol {
    private let combinations: Combinations<ValueCollection>
    private var currentIndex: Int = -1

    public init(_ combinations: Combinations<ValueCollection>) {
        self.combinations = combinations
    }

    public mutating func next() -> Combinations<ValueCollection>.Element? {
        currentIndex += 1

        guard currentIndex < combinations.count else {
            return nil
        }

        return combinations[currentIndex]
    }
}
