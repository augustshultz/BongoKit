import XCTest

extension BongoNetworkControllerTest {
    static let __allTests = [
        ("testStops", testStops),
    ]
}

extension PredictionTest {
    static let __allTests = [
        ("testPredictionNameDecode", testPredictionNameDecode),
        ("testPredictionShortNameDecode", testPredictionShortNameDecode),
    ]
}

extension RouteTest {
    static let __allTests = [
        ("testShortNameDecode", testShortNameDecode),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BongoNetworkControllerTest.__allTests),
        testCase(PredictionTest.__allTests),
        testCase(RouteTest.__allTests),
    ]
}
#endif
