//
//  Created by August on 11/9/19.
//

import XCTest
@testable import BongoKit

class RoutesTest: XCTestCase {

    func testFetchRoutes() {

        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "routes", withExtension: "json"), let jsonData = try? Data(contentsOf: url) else {
            XCTFail("Could not get file data")
            fatalError()
        }

        let mockSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
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
}
