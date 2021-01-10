import Foundation

public struct Permutations<ElementCollection: Collection> {
    /// The collection of elements.
    public let elements: ElementCollection

    /// The number of elements per permutation.
    public let length: Int

    /// Whether or not elements are allowed to be repeated more than once.
    public let withReplacement: Bool

    /// The number of possible permutations.
    public let count: Int

    /// Returns all possible permutations of the collection's elements.
    ///
    /// - Parameters:
    ///     - length: The number of elements per permutation (defaults to the number of elements in the collection).
    ///     - withReplacement: Whether or not elements are allowed to be repeated more than once.
    ///
    /// - Complexity: Permutations are only computed upon iteration, and accessing any element in the collection of
    ///               permutations has a runtime of O(?).
    ///
    /// - SeeAlso: [Permutations](https://en.wikipedia.org/wiki/Permutations)
    ///
    public init(_ elements: ElementCollection, length: Int? = nil, withReplacement: Bool = false) {
        let length = length ?? elements.count

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
        if withReplacement {
            return permutationWithReplacement(at: index)
        } else {
            return permutation(at: index)
        }
    }
}

extension Permutations {
    /// Returns the number of possible permutations, with replacement.
    ///
    /// - Parameters:
    ///     - numberOfElements: The number of elements in the original collection.
    ///     - length: The number of elements per permutation.
    ///
    private static func countWithReplacement(numberOfElements: Int, length: Int) -> Int {
        numberOfElements ** length
    }

    /// Returns the number of possible permutations.
    ///
    /// - Parameters:
    ///     - numberOfElements: The number of elements in the original collection.
    ///     - length: The number of elements per permutation.
    ///
    private static func count(numberOfElements: Int, length: Int) -> Int {
        Int(numberOfElements.factorial / (numberOfElements - length).factorial)
    }
}

extension Permutations {
    private func permutationWithReplacement(at index: Int) -> [ElementCollection.Element] {
        baseCoefficents(of: index, radix: elements.count)
            .reversed()
            .map { elements[$0] }
    }

    /// - SeeAlso: [Factorial number system: Permutations](https://en.wikipedia.org/wiki/Factorial_number_system#Permutations)
    private func permutation(at index: Int) -> [ElementCollection.Element] {
        var permutation = Element()

        let stride = (elements.count - length).factorial
        var indices = factorialCoefficients(of: index * stride)
        var elements = Array(self.elements)

        while permutation.count < length {
            permutation.append(elements.remove(at: indices.removeLast()))
        }

        return permutation
    }
}

extension Permutations {
    /// Returns the first elements up to length `length` in a new base.
    ///
    /// - Parameters:
    ///     - degree: a non-negative integer.
    ///     - radix: the new base.
    ///
    private func baseCoefficents(of degree: Int, radix: Int) -> [Int] {
        var coefficients = [Int]()

        var quotient = degree
        var remainder = 0

        while quotient > 0 {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: radix)
            coefficients.append(remainder)
        }

        while coefficients.count < length {
            coefficients.append(0)
        }

        return coefficients
    }

    /// Returns the first elements up to length `elements.count` in the factorial number system.
    ///
    /// - Parameter degree: a non-negative integer.
    ///
    /// - SeeAlso: [Factorial number system](https://en.wikipedia.org/wiki/Factorial_number_system)
    ///
    private func factorialCoefficients(of degree: Int) -> [Int] {
        var coefficients = [Int]()

        var quotient = degree
        var remainder = 0
        var radix = 1

        while quotient > 0 {
            (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: radix)
            coefficients.append(remainder)
            radix += 1
        }

        while coefficients.count < elements.count {
            coefficients.append(0)
        }

        return coefficients
    }
}
