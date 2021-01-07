import Foundation

extension Permutations: Collection {
    public var startIndex: Int {
        0
    }

    public var endIndex: Int {
        count
    }

    public func index(after i: Int) -> Int {
        i + 1
    }

    public func makeIterator() -> PermutationsIterator<C> {
        PermutationsIterator(self)
    }
}

public struct PermutationsIterator<C: Collection>: IteratorProtocol {
    private let permutations: Permutations<C>
    private var currentIndex: Int = -1

    public init(_ permutations: Permutations<C>) {
        self.permutations = permutations
    }

    public mutating func next() -> Permutations<C>.Element? {
        currentIndex += 1

        guard currentIndex < permutations.count else {
            return nil
        }

        return permutations[currentIndex]
    }
}
