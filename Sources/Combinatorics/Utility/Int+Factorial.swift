import Foundation

extension Int {
    var factorial: Int {
        assert(self >= 0, "integer must be non-negative")

        if self == 0 {
            return 1
        } else {
            return (1...self).reduce(1, *)
        }
    }
}
