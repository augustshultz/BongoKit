//
//  Created by August Shultz on 11/1/19.
//

import XCTest

@testable import BongoKit

class StopTests: XCTestCase {

    func testDecodeSingleJsonStop() throws {
        let json = try Data(fromJsonFileNamed: "single_stop")
        let actual = try JSONDecoder().decode(Stop.self, from: json)
        XCTAssertEqual(actual.stopId, "1")
        XCTAssertEqual(actual.name, "Downtown Interchange")
        XCTAssertEqual(actual.lat, 41.660199)
        XCTAssertEqual(actual.lon, -91.535049)
    }

    func testDecodeMultipleJsonStops() throws {
        let json = try Data(fromJsonFileNamed: "multiple_stops")
        let actual = try JSONDecoder().decode([Stop].self, from: json)
        XCTAssertEqual(actual.count, 2)
    }
}
