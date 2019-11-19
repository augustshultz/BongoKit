//
//  Created by August on 11/8/19.
//

import XCTest
@testable import BongoKit

class PredictionsTests: XCTestCase {

    func testFetchPredictions() {
        guard let predictionsJsonUrl = Bundle(for: type(of: self)).url(forResource: "predictions", withExtension: "json"),
              let jsonData = try? Data(contentsOf: predictionsJsonUrl) else {
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

    func testFetchPredictionsFailsToReturnData() {
        let mockSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        let networkController = BongoNetworkController(session: mockSession)
        let fetchPredictionsExpectation = expectation(description: "wait for predictions to be fetched")
        networkController.fetchPredictions(forStopNumber: 1) { (result) in
            switch result {
            case .success:
                XCTFail("The test should have failed")
            case .failure(let error):
                guard let bongoError = error as? BongoError else {
                    fatalError()
                }
                XCTAssertEqual(bongoError, BongoError.fetchFailedToReturnAnyData)
            }
            fetchPredictionsExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }
    }
}
