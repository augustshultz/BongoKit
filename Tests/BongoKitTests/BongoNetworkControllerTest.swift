//
//  Created by August Shultz on 3/7/19.
//

import XCTest
@testable import BongoKit

class BongoNetworkControllerTest: XCTestCase {

  let networkController = BongoNetworkController()
  
  func testFetchStops() {
    let semaphore = DispatchSemaphore(value: 0)
    networkController.fetchStops { (result) in
      switch result {
      case .success(let stops):
        XCTAssertTrue(!stops.isEmpty)
      case .failure(_):
        XCTFail()
      }
      semaphore.signal()
    }
    _ = semaphore.wait(timeout: .distantFuture)
  }
}
