import XCTest
@testable import Combinatorics

final class CombinationsTests: XCTestCase {

    // MARK: - Combinations with replacement

    func testEmptyCollectionWithReplacement() {
        for length in 0...3 {
            XCTAssertEqual(
                Array(Combinations([Int](), length: length, withReplacement: true)),
                []
            )
        }
    }

    func testOneItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Combinations([1], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1], length: 1, withReplacement: true)),
            [[1]]
        )

        XCTAssertEqual(
            Array(Combinations([1], length: 2, withReplacement: true)),
            [[1, 1]]
        )

        XCTAssertEqual(
            Array(Combinations([1], length: 3, withReplacement: true)),
            [[1, 1, 1]]
        )
    }

    func testTwoItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Combinations([1, 2], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1, 2], length: 1, withReplacement: true)),
            [[1], [2]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2], length: 2, withReplacement: true)),
            [[1, 1], [1, 2], [2, 2]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2], length: 3, withReplacement: true)),
            [[1, 1, 1], [1, 1, 2], [1, 2, 2], [2, 2, 2]]
        )
    }

    func testThreeItemCollectionWithReplacement() {
        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 1, withReplacement: true)),
            [[1], [2], [3]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 2, withReplacement: true)),
            [[1, 1], [1, 2], [2, 2], [1, 3], [2, 3], [3, 3]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 3, withReplacement: true)),
            [[1, 1, 1], [1, 1, 2], [1, 2, 2], [2, 2, 2], [1, 1, 3], [1, 2, 3], [2, 2, 3], [1, 3, 3], [2, 3, 3], [3, 3, 3]]
        )
    }

    func testStringsWithReplacement() {
        XCTAssertEqual(
            Array(Combinations("abc", length: 0, withReplacement: true)),
            []
        )

        XCTAssertEqual(
            Array(Combinations("abc", length: 1, withReplacement: true)),
            [["a"], ["b"], ["c"]]
        )

        XCTAssertEqual(
            Array(Combinations("abc", length: 2, withReplacement: true)),
            [["a", "a"], ["a", "b"], ["b", "b"], ["a", "c"], ["b", "c"], ["c", "c"]]
        )
    }

    func testCollectionExtensionWithReplacement() {
        XCTAssertEqual(
            Array(Combinations("abc", length: 1, withReplacement: true)),
            Array("abc".combinations(length: 1, withReplacement: true))
        )
    }

    // MARK: - Combinations without replacement

    func testEmptyCollection() {
        XCTAssertEqual(
            Array(Combinations([Int](), length: 0)),
            []
        )
    }

    func testOneItemCollection() {
        XCTAssertEqual(
            Array(Combinations([1], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1], length: 1)),
            [[1]]
        )
    }

    func testTwoItemCollection() {
        XCTAssertEqual(
            Array(Combinations([1, 2], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1, 2], length: 1)),
            [[1], [2]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2], length: 2)),
            [[1, 2]]
        )
    }

    func testThreeItemCollection() {
        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 1)),
            [[1], [2], [3]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 2)),
            [[1, 2], [1, 3], [2, 3]]
        )

        XCTAssertEqual(
            Array(Combinations([1, 2, 3], length: 3)),
            [[1, 2, 3]]
        )
    }

    func testStrings() {
        XCTAssertEqual(
            Array(Combinations("abc", length: 0)),
            []
        )

        XCTAssertEqual(
            Array(Combinations("abc", length: 1)),
            [["a"], ["b"], ["c"]]
        )

        XCTAssertEqual(
            Array(Combinations("abc", length: 2)),
            [["a", "b"], ["a", "c"], ["b", "c"]]
        )
    }

    func testCollectionExtension() {
        XCTAssertEqual(
            Array(Combinations("abc", length: 1)),
            Array("abc".combinations(length: 1))
        )
    }
}
