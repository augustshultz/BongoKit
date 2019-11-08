//
//  Created by August on 11/8/19.
//

import XCTest
@testable import BongoKit

class PredictionsTests: XCTestCase {

    func testFetchPredictions() {

      guard let jsonData = predictionsJson.data(using: .utf8) else {
        fatalError("Could not convert string contents into data")
      }
      let mockSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
      let networkController = BongoNetworkController(session: mockSession)
      let fetchPredictionsExpectation = expectation(description: "wait for predictions to be fetched")
      networkController.fetchPredictions(forStopNumber: 1) { (result) in
        switch result {
        case .success(let predictions):
          XCTAssertTrue(!predictions.isEmpty)
          XCTAssertEqual(predictions.count, 3)
        case .failure:
          XCTFail("Fetch failed")
        }
          fetchPredictionsExpectation.fulfill()
      }
      waitForExpectations(timeout: 1) { (error) in
          XCTAssertNil(error)
      }
    }

}

private let predictionsJson = """
[
  {
    "routeid": 2433,
    "name": "Hawkeye Express",
    "shortname": "Hawk Exp",
    "busid": 2917,
    "busnumber": "101",
    "seconds": -6,
    "minutes": 0,
    "schedulePrediction": false,
    "agency": "uiowa",
    "agencyname": "Cambus"
  },
  {
    "routeid": 2369,
    "name": "Red Route",
    "shortname": "Red",
    "busid": 2915,
    "busnumber": "112",
    "seconds": -5,
    "minutes": 0,
    "schedulePrediction": false,
    "agency": "uiowa",
    "agencyname": "Cambus"
  },
  {
    "routeid": 2355,
    "name": "Oakcrest",
    "shortname": "oakcrst",
    "busid": 4108,
    "busnumber": "81",
    "seconds": 68,
    "minutes": 2,
    "schedulePrediction": false,
    "agency": "iowacity",
    "agencyname": "Iowa City Transit"
  }
]
"""
