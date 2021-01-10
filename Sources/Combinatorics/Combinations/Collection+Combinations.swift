import Foundation

extension Collection {
    /// Returns all possible combinations of the collection's elements.
    ///
    /// - Parameters:
    ///     - length: The number of elements per combination.
    ///     - withReplacement: Whether or not elements are allowed to be repeated more than once.
    ///
    /// - Complexity: Combinations are only computed upon iteration, and accessing any element in the collection of
    ///               combinations has a runtime of O(?).
    ///
    /// - SeeAlso: [Combinations](https://en.wikipedia.org/wiki/Combinations)
    ///
    public func combinations(length: Int, withReplacement: Bool = false) -> Combinations<Self> {
        Combinations(self, length: length, withReplacement: withReplacement)
    }
}
