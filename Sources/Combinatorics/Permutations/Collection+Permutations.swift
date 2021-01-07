import Foundation

extension Collection {
    public func permutations(length: Int, withReplacement: Bool = false) -> Permutations<Self> {
        Permutations(self, length: length, withReplacement: withReplacement)
    }
}
