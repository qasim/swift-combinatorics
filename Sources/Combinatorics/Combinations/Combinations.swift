import Foundation

public struct Combinations<ElementCollection: Collection> {
    /// The collection of elements.
    public let elements: ElementCollection

    /// The number of elements per combination.
    public let length: Int

    /// Whether or not elements are allowed to be repeated more than once.
    public let withReplacement: Bool

    /// The number of possible combinations.
    public let count: Int

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
    public init(_ elements: ElementCollection, length: Int, withReplacement: Bool = false) {
        assert(length >= 0, "length must be non-negative")

        if !withReplacement {
            assert(length <= elements.count, "length must be less than or equal to the number of elements")
        }

        self.elements = elements
        self.length = length
        self.withReplacement = withReplacement

        if elements.count > 0 && length > 0 {
            if withReplacement {
                self.count = Self.countWithReplacement(numberOfElements: elements.count, length: length)
            } else {
                self.count = Self.count(numberOfElements: elements.count, length: length)
            }
        } else {
            self.count = 0
        }
    }

    public subscript(_ index: Int) -> [ElementCollection.Element] {
        combinatorialNumbers(of: index).reversed().map { elements[$0] }
    }
}

extension Combinations {
    /// Returns the number of possible combinations, with replacement.
    ///
    /// - Parameters:
    ///     - numberOfElements: The number of elements in the original collection.
    ///     - length: The number of elements per combination.
    ///
    private static func countWithReplacement(numberOfElements: Int, length: Int) -> Int {
        (numberOfElements + length - 1).factorial / (length.factorial * (numberOfElements - 1).factorial)
    }

    /// Returns the number of possible combinations.
    ///
    /// - Parameters:
    ///     - numberOfElements: The number of elements in the original collection.
    ///     - length: The number of elements per combination.
    ///
    private static func count(numberOfElements: Int, length: Int) -> Int {
        numberOfElements.factorial / (length.factorial * (numberOfElements - length).factorial)
    }
}

extension Combinations {
    /// Returns the first elements up to length `length` in the combinatorial number system.
    ///
    /// - Parameter degree: a non-negative integer.
    ///
    /// - SeeAlso: [Combinatorial number system](https://en.wikipedia.org/wiki/Combinatorial_number_system)
    ///
    private func combinatorialNumbers(of degree: Int) -> [Int] {
        assert(degree >= 0, "degree must be non-negative")
        var numbers = [Int]()

        var currentDegree = degree
        var currentLength = length

        while numbers.count < length {
            var count = 0

            for numberOfElements in (withReplacement ? 1 : currentLength)... {
                let nextCount = withReplacement
                    ? Self.countWithReplacement(numberOfElements: numberOfElements, length: currentLength)
                    : Self.count(numberOfElements: numberOfElements, length: currentLength)

                if nextCount > currentDegree {
                    currentDegree -= count
                    currentLength -= 1
                    numbers.append(numberOfElements - 1)
                    break
                }

                count = nextCount
            }
        }

        return numbers
    }
}
