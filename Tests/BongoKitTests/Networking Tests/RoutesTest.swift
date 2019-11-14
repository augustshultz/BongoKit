//
//  Created by August on 11/9/19.
//

import XCTest
@testable import BongoKit

class RoutesTest: XCTestCase {

    func testFetchRoutes() throws {
        let bundle = Bundle(for: type(of: self))
        let json = try Data(fromJsonFileNamed: "routes", forBundle: bundle)
        let mockSession = MockURLSession(data: json, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let fetchRoutesExpectation = expectation(description: "wait for predictions to be fetched")
        networkController.fetchRoutes { (result) in
            switch result {
            case .success(let routes):
                XCTAssertTrue(!routes.isEmpty)
                XCTAssertEqual(routes.count, 3)
            case .failure:
                XCTFail("Fetch failed")
            }
            fetchRoutesExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }
    }

    func testFetchRouteFails() throws {
        let mockSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let failureExpectation = expectation(description: "wait for the failure")
        networkController.fetchRoutes { (result) in
            switch result {
            case .success:
                XCTFail("this should not succeed")
            case .failure(let error):
                guard let bongoError = error as? BongoError else {
                    XCTFail("unexpected error type")
                    fatalError()
                }
                XCTAssertEqual(bongoError, BongoError.failedToFetchRoutes)
            }
            failureExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
