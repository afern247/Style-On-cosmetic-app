import XCTest
@testable import SwiftPM_GithubAction

final class SwiftPM_GithubActionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPM_GithubAction().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
