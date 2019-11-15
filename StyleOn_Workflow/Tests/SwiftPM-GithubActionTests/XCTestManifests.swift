import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftPM_GithubActionTests.allTests),
    ]
}
#endif
