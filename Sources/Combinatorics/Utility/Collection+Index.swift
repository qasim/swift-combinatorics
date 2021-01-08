import Foundation

extension Collection {
    subscript(_ index: Int) -> Element {
        self[self.index(startIndex, offsetBy: index)]
    }
}
