//
//  Created by August on 11/9/19.
//

import XCTest
@testable import BongoKit

class RoutesTest: XCTestCase {

    func testFetchRoutes() {

        guard let jsonData = routesJson.data(using: .utf8) else {
            fatalError("Could not convert string contents into data")
        }
        let mockSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let fetchRoutesExpectation = expectation(description: "wait for predictions to be fetched")
        networkController.fetchRoutes() { (result) in
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

private let routesJson = """
[
  {
    "id": 2336,
    "name": "7th Avenue",
    "shortname": "7thave",
    "color": "#FFC53D",
    "agency": "iowacity",
    "agencyname": "Iowa City Transit"
  },
  {
    "id": 2337,
    "name": "Broadway",
    "shortname": "brdwy",
    "color": "#127AE3",
    "agency": "iowacity",
    "agencyname": "Iowa City Transit"
  },
  {
    "id": 2338,
    "name": "Broadway Night and Saturday",
    "shortname": "brdwynw",
    "color": "#783730",
    "agency": "iowacity",
    "agencyname": "Iowa City Transit"
  }
]
"""
