//
//  Created by August Shultz on 3/7/19.
//

import XCTest
@testable import BongoKit

class BongoNetworkControllerTest: XCTestCase {

  func testFetchStops() {

    guard let jsonData = stops.data(using: .utf8) else {
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

private let stops = """
[
  {
    "id": "1",
    "name": "Downtown Interchange",
    "lat": 41.660199,
    "lon": -91.535049
  },
  {
    "id": "2",
    "name": "Downtown Interchange",
    "lat": 41.660103,
    "lon": -91.53553599999998
  },
  {
    "id": "100",
    "name": "Softball Complex",
    "lat": 41.6687,
    "lon": -91.56510000000004
  }
]
"""
