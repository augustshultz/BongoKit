//
//  Created by August Shultz on 11/1/19.
//

import XCTest
@testable import BongoKit

class BongoURLTests: XCTestCase {

    func testRouteInfoURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/routes/1") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.routeInfo(1).url
        XCTAssertEqual(expectedUrl, actualUrl)
    }

    func testRouteListURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/routes/") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.routeList.url
        XCTAssertEqual(expectedUrl, actualUrl)
    }

    func testPredictionsURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/predictions/1") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.predictions(1).url
        XCTAssertEqual(expectedUrl, actualUrl)
    }

    func testStopListURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/stops/") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.stopList.url
        XCTAssertEqual(expectedUrl, actualUrl)
    }

    func testStopInfoURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/stops/1") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.stopInfo(1).url
        XCTAssertEqual(expectedUrl, actualUrl)
    }

    func testBusesURL() {

        guard let expectedUrl = URL(string: "https://api.bongo.org/buses/1") else {
            XCTFail("Invalid url")
            return
        }
        let actualUrl = BongoURL.buses(1).url
        XCTAssertEqual(expectedUrl, actualUrl)
    }
}
