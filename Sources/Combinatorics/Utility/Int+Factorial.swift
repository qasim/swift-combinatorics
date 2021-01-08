import Foundation

extension Int {
    var factorial: Int {
        assert(self >= 0, "integer must be non-negative")

        if (0...1).contains(self) {
            return 1
        } else {
            return self * (self - 1).factorial
        }
    }
}
