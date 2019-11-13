//
//  Created by August Shultz on 3/6/19.
//

import XCTest
@testable import BongoKit

class RouteTest: XCTestCase {

    let jsonDecoder = JSONDecoder()

    func testShortNameDecode() throws {
        let json = try Data(fromJsonFileNamed: "single_route", forBundle: Bundle(for: type(of: self)))
        let route = try jsonDecoder.decode(Route.self, from: json)
        XCTAssertEqual(route.shortName, "courthill")
    }

    func testAgencyNameDecode() throws {
        let json = try Data(fromJsonFileNamed: "single_route", forBundle: Bundle(for: type(of: self)))
        let route = try jsonDecoder.decode(Route.self, from: json)
        XCTAssertEqual(route.agencyName, "Iowa City Transit")
    }

    func testDecodingMultipleRoutesFromJSON() throws {
        let json = try Data(fromJsonFileNamed: "multiple_routes", forBundle: Bundle(for: type(of: self)))
        let actualRoutes = try jsonDecoder.decode([Route].self, from: json)
        XCTAssert(actualRoutes.count == 2)
    }
}
