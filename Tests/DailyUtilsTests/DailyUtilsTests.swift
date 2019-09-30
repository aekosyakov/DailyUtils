import XCTest
@testable import DailyUtils

final class DailyUtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DailyUtils().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
