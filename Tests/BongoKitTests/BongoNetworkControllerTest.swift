//
//  Created by August Shultz on 3/7/19.
//

import XCTest
@testable import BongoKit

class BongoNetworkControllerTest: XCTestCase {

  let networkController = BongoNetworkController()

  func testStops() {
    let stops = networkController.synchronouslyFetchStops()

    XCTAssertTrue(!stops.isEmpty)
  }
}
