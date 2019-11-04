//
//  Created by August Shultz on 11/1/19.
//

import XCTest

@testable import BongoKit

class StopTests: XCTestCase {

    func testDecodeSingleJsonStop() {
        do {
            let decoder = JSONDecoder()
            let actual = try decoder.decode(Stop.self, from: singleStopJson.data(using: .utf8)!)
            XCTAssertEqual(actual.stopId, "1")
            XCTAssertEqual(actual.name, "Downtown Interchange")
            XCTAssertEqual(actual.lat, 41.660199)
            XCTAssertEqual(actual.lon, -91.535049)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testDecodeMultipleJsonStops() {
        do {
            let decoder = JSONDecoder()
            let actual = try decoder.decode([Stop].self, from: multiStopJson.data(using: .utf8)!)
            XCTAssertEqual(actual.count, 2)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
}

private let singleStopJson = """
{
    "id": "1",
    "name": "Downtown Interchange",
    "lat": 41.660199,
    "lon": -91.535049
}
"""

private let multiStopJson = """
[
    {
        "id": "1",
        "name": "Downtown Interchange",
        "lat": 41.660199,
        "lon": -91.535049
    },
    {
        "id": "2",
        "name": "Downtown Interchange",
        "lat": 41.660103,
        "lon": -91.53553599999998
    }
]
"""
