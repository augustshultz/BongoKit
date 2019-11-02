//
//  Created by August Shultz on 3/6/19.
//

import XCTest
@testable import BongoKit

class RouteTest: XCTestCase {

  let json = """
{
    "id": 2339,
    "name": "Court Hill",
    "shortname": "courthill",
    "color": "#3A2445",
    "agency": "iowacity",
    "agencyname": "Iowa City Transit"
}
"""

  let jsonDecoder = JSONDecoder()
  var route: Route?

  override func setUp() {
    route = try? jsonDecoder.decode(Route.self, from: json.data(using: .utf8)!)
  }

  func testShortNameDecode() {
    XCTAssertEqual(route?.shortName, "courthill")
  }

  func testAgencyNameDecode() {
    XCTAssertEqual(route?.agencyName, "Iowa City Transit")
  }
}
