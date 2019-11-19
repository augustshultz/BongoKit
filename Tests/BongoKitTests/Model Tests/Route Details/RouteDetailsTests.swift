//
//  Created by August on 11/17/19.
//

import XCTest
@testable import BongoKit

class RouteDetailsTests: XCTestCase {

    func testRouteDecoded() throws {
        let data = try Data(fromJsonFileNamed: "single_route_details", forBundle: Bundle(for: type(of: self)))
        let routeDetails = try JSONDecoder().decode(RouteDetails.self, from: data)
        XCTAssertEqual(routeDetails.route.routeId, 2355)
    }

    func testStopsDecoded() throws {
        do {
            let data = try Data(fromJsonFileNamed: "single_route_details", forBundle: Bundle(for: type(of: self)))
            let routeDetails = try JSONDecoder().decode(RouteDetails.self, from: data)
            XCTAssertGreaterThan(routeDetails.stops.count, 0)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testMaxMinLatitudeLongitudeDecoded() throws {
        do {
            let data = try Data(fromJsonFileNamed: "single_route_details", forBundle: Bundle(for: type(of: self)))
            let routeDetails = try JSONDecoder().decode(RouteDetails.self, from: data)
            XCTAssertEqual(routeDetails.maxLatitude, 41.6602)
            XCTAssertEqual(routeDetails.minLatitude, 41.65046)
            XCTAssertEqual(routeDetails.maxLongitude, -91.53505)
            XCTAssertEqual(routeDetails.minLongitude, -91.5597)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testPathDecoded() throws {
        let data = try Data(fromJsonFileNamed: "single_route_details", forBundle: Bundle(for: type(of: self)))
        let routeDetails = try JSONDecoder().decode(RouteDetails.self, from: data)
        XCTAssertGreaterThan(routeDetails.path.count, 0)
    }
}
