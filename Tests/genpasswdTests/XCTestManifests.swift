import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(bcrypt_hash_genTests.allTests),
    ]
}
#endif
