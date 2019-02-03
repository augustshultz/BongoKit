import XCTest
@testable import BongoKit

final class BongoKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BongoKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
