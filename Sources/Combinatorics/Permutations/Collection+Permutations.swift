import Foundation

extension Collection {
    /// Returns all possible permutations of the collection's elements.
    ///
    /// - Parameters:
    ///     - length: The number of elements per permutation (defaults to the number of elements in the collection).
    ///     - withReplacement: Whether or not elements are allowed to be repeated more than once.
    ///
    /// - Complexity: Each permutation is only computed upon access, and accessing any element in the collection of
    ///               permutations has a runtime of `O(n)`.
    ///
    /// - SeeAlso: [Permutations](https://en.wikipedia.org/wiki/Permutations)
    ///
    public func permutations(length: Int? = nil, withReplacement: Bool = false) -> Permutations<Self> {
        Permutations(self, length: length, withReplacement: withReplacement)
    }
}
