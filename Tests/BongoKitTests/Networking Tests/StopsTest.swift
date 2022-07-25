//
//  Created by August Shultz on 3/7/19.
//

import XCTest
@testable import BongoKit

class StopsTest: XCTestCase {

    func testFetchStops() throws {
        let jsonData = try Data(fromJsonFileNamed: "stops")
        let mockSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let fetchStopsExpectation = expectation(description: "wait for stops to be fetched")
        networkController.fetchStops { (result) in
            switch result {
            case .success(let stops):
                XCTAssertTrue(!stops.isEmpty)
                XCTAssertEqual(stops.count, 3)
            case .failure:
                XCTFail("Fetch failed")
            }
            fetchStopsExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }
    }

    func testFetchStopsFailsWithoutData() {
        let mockSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let fetchStopsExpectation = expectation(description: "wait for stops to be fetched")
        networkController.fetchStops { (result) in
            switch result {
            case .success:
                XCTFail("Fetch should not succeed")
            case .failure(let error):
                guard let bongoError = error as? BongoError else {
                    XCTFail("The fetch error should be a BongoError")
                    fatalError()
                }
                XCTAssertEqual(bongoError, BongoError.fetchFailedToReturnAnyData)
            }
            fetchStopsExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }
    }
}
