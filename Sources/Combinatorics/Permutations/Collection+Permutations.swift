import Foundation

extension Collection {
    public func permutations(length: Int? = nil, withReplacement: Bool = false) -> Permutations<Self> {
        Permutations(self, length: length, withReplacement: withReplacement)
    }
}
