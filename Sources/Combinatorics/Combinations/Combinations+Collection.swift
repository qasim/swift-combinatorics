import Foundation

extension Combinations: Collection {
    public typealias Element = [ElementCollection.Element]

    public var startIndex: Int {
        0
    }

    public var endIndex: Int {
        count
    }

    public func index(after i: Int) -> Int {
        i + 1
    }

    public func makeIterator() -> CombinationsIterator<ElementCollection> {
        CombinationsIterator(self)
    }
}

public struct CombinationsIterator<ElementCollection: Collection>: IteratorProtocol {
    private let combinations: Combinations<ElementCollection>
    private var currentIndex: Int = -1

    public init(_ combinations: Combinations<ElementCollection>) {
        self.combinations = combinations
    }

    public mutating func next() -> Combinations<ElementCollection>.Element? {
        currentIndex += 1

        guard currentIndex < combinations.count else {
            return nil
        }

        return combinations[currentIndex]
    }
}
