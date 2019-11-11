//
//  Created by August Shultz on 3/7/19.
//

import XCTest
@testable import BongoKit

class StopsTest: XCTestCase {

    func testFetchStops() {

        guard let jsonDataUrl = Bundle(for: type(of: self)).url(forResource: "stops", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonDataUrl) else {
            fatalError("Could not convert string contents into data")
        }
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
}
