//
//  Created by August Shultz on 11/1/19.
//

import XCTest
@testable import BongoKit

class BongoURLTests: XCTestCase {

    func testRouteInfoURL() throws {
        let routeId = Int.randomPositive()
        let expectedUrl = URL(string: "https://api.bongo.org/routes/\(routeId)")!
        XCTAssertEqual(expectedUrl, .bongoRouteInfo(route: routeId))
    }

    func testRouteListURL() throws {
        let expectedUrl = URL(string: "https://api.bongo.org/routes/")!
        XCTAssertEqual(expectedUrl, .bongoRouteList)
    }

    func testPredictionsURL() throws {
        let stopId = Int.randomPositive()
        let expectedUrl = URL(string: "https://api.bongo.org/predictions/\(stopId)")!
        XCTAssertEqual(expectedUrl, .bongoPredictions(for: stopId))
    }

    func testStopListURL() throws {
        let expectedUrl = URL(string: "https://api.bongo.org/stops/")!
        XCTAssertEqual(expectedUrl, .bongoStopList)
    }

    func testStopInfoURL() throws {
        let stopId = Int.randomPositive()
        let expectedUrl = URL(string: "https://api.bongo.org/stops/\(stopId)")!
        XCTAssertEqual(expectedUrl, .bongoStopInfo(for: stopId))
    }

    func testBusesURL() throws {
        let routeId = Int.randomPositive()
        let expectedUrl = URL(string: "https://api.bongo.org/buses/\(routeId)")!
        XCTAssertEqual(expectedUrl, .bongoBuses(for: routeId))
    }
}

extension Int {
    static func randomPositive() -> Int {
        return .random(in: 1...Int.max)
    }
}
