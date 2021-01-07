import Foundation

extension Int {
    var factorial: Int {
        if self == 1 {
            return 1
        } else {
            return self * (self - 1).factorial
        }
    }
}
