import Foundation

extension Collection {
    /// Returns all possible combinations of the collection's elements.
    ///
    /// - Parameters:
    ///     - length: The number of elements per combination.
    ///     - withReplacement: Whether or not elements are allowed to be repeated more than once.
    ///
    /// - Complexity: Each combination is only computed upon access, and accessing any element in the collection of
    ///               combinations has a runtime of `O(n)`.
    ///
    /// - SeeAlso: [Combinations](https://en.wikipedia.org/wiki/Combinations)
    ///
    public func combinations(length: Int, withReplacement: Bool = false) -> Combinations<Self> {
        Combinations(self, length: length, withReplacement: withReplacement)
    }
}
