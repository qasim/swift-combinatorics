import XCTest
@testable import Combinatorics

final class PermutationsTests: XCTestCase {

    // MARK: - Permutations with replacement

    func testEmptyCollectionWithReplacement() {
        for length in 0...3 {
            XCTAssertEqual(
                Array(Permutations([Int](), length: length, withReplacement: true)),
                []
            )
        }
    }

    func testOneItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Permutations([1], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1], length: 1, withReplacement: true)),
            [[1]]
        )

        XCTAssertEqual(
            Array(Permutations([1], length: 2, withReplacement: true)),
            [[1, 1]]
        )

        XCTAssertEqual(
            Array(Permutations([1], length: 3, withReplacement: true)),
            [[1, 1, 1]]
        )
    }

    func testTwoItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Permutations([1, 2], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1, 2], length: 1, withReplacement: true)),
            [[1], [2]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2], length: 2, withReplacement: true)),
            [[1, 1], [1, 2], [2, 1], [2, 2]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2], length: 3, withReplacement: true)),
            [[1, 1, 1], [1, 1, 2], [1, 2, 1], [1, 2, 2], [2, 1, 1], [2, 1, 2], [2, 2, 1], [2, 2, 2]]
        )
    }

    func testThreeItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 1, withReplacement: true)),
            [[1], [2], [3]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 2, withReplacement: true)),
            [[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 3, withReplacement: true)),
            [
                [1, 1, 1], [1, 1, 2], [1, 1, 3], [1, 2, 1], [1, 2, 2], [1, 2, 3], [1, 3, 1], [1, 3, 2], [1, 3, 3],
                [2, 1, 1], [2, 1, 2], [2, 1, 3], [2, 2, 1], [2, 2, 2], [2, 2, 3], [2, 3, 1], [2, 3, 2], [2, 3, 3],
                [3, 1, 1], [3, 1, 2], [3, 1, 3], [3, 2, 1], [3, 2, 2], [3, 2, 3], [3, 3, 1], [3, 3, 2], [3, 3, 3],
            ]
        )
    }

    func testStringsWithReplacement() {
        XCTAssertEqual(
            Array(Permutations("abc", length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Permutations("abc", length: 1, withReplacement: true)),
            [["a"], ["b"], ["c"]]
        )

        XCTAssertEqual(
            Array(Permutations("abc", length: 2, withReplacement: true)),
            [["a", "a"], ["a", "b"], ["a", "c"], ["b", "a"], ["b", "b"], ["b", "c"], ["c", "a"], ["c", "b"], ["c", "c"]]
        )
    }

    func testCollectionExtensionWithReplacement() {
        XCTAssertEqual(
            Array(Permutations("abc", length: 1, withReplacement: true)),
            Array("abc".permutations(length: 1, withReplacement: true))
        )
    }

    // MARK: - Permutations without replacement

    func testEmptyCollection() {
        XCTAssertEqual(
            Array(Permutations([Int](), length: 0)),
            []
        )
    }

    func testOneItemCollection() {
        XCTAssertEqual(
            Array(Permutations([1], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1], length: 1)),
            [[1]]
        )
    }

    func testTwoItemCollection() {
        XCTAssertEqual(
            Array(Permutations([1, 2], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1, 2], length: 1)),
            [[1], [2]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2], length: 2)),
            [[1, 2], [2, 1]]
        )
    }

    func testThreeItemCollection() {
        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 1)),
            [[1], [2], [3]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 2)),
            [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]
        )

        XCTAssertEqual(
            Array(Permutations([1, 2, 3], length: 3)),
            [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        )
    }

    func testStrings() {
        XCTAssertEqual(
            Array(Permutations("abc", length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Permutations("abc", length: 1)),
            [["a"], ["b"], ["c"]]
        )

        XCTAssertEqual(
            Array(Permutations("abc", length: 2)),
            [["a", "b"], ["a", "c"], ["b", "a"], ["b", "c"], ["c", "a"], ["c", "b"]]
        )
    }

    func testCollectionExtension() {
        XCTAssertEqual(
            Array(Permutations("abc", length: 1)),
            Array("abc".permutations(length: 1))
        )
    }
}
