import Foundation

extension Permutations: Collection {
    public typealias Element = [ValueCollection.Element]

    public var startIndex: Int {
        0
    }

    public var endIndex: Int {
        count
    }

    public func index(after i: Int) -> Int {
        i + 1
    }

    public func makeIterator() -> PermutationsIterator<ValueCollection> {
        PermutationsIterator(self)
    }
}

public struct PermutationsIterator<ValueCollection: Collection>: IteratorProtocol {
    private let permutations: Permutations<ValueCollection>
    private var currentIndex: Int = -1

    public init(_ permutations: Permutations<ValueCollection>) {
        self.permutations = permutations
    }

    public mutating func next() -> Permutations<ValueCollection>.Element? {
        currentIndex += 1

        guard currentIndex < permutations.count else {
            return nil
        }

        return permutations[currentIndex]
    }
}
