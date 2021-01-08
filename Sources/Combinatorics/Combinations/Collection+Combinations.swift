import Foundation

extension Collection {
    public func combinations(length: Int, withReplacement: Bool = false) -> Combinations<Self> {
        Combinations(self, length: length, withReplacement: withReplacement)
    }
}
