import Foundation

extension Permutations: Collection {
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

    public func makeIterator() -> PermutationsIterator<ElementCollection> {
        PermutationsIterator(self)
    }
}

public struct PermutationsIterator<ElementCollection: Collection>: IteratorProtocol {
    private let permutations: Permutations<ElementCollection>
    private var currentIndex: Int = -1

    public init(_ permutations: Permutations<ElementCollection>) {
        self.permutations = permutations
    }

    public mutating func next() -> Permutations<ElementCollection>.Element? {
        currentIndex += 1

        guard currentIndex < permutations.count else {
            return nil
        }

        return permutations[currentIndex]
    }
}
