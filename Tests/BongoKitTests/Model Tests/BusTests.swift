//
//  Created by August Shultz on 11/1/19.
//

import XCTest

@testable import BongoKit

class BusTests: XCTestCase {

    func testDecodeBusJson() {
        let decoder = JSONDecoder()
        do {
            let actual = try decoder.decode(Bus.self, from: busJson.data(using: .utf8)!)
            XCTAssertEqual(actual.id, 2915)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

}

private let busJson = """
{
    "id": 2915,
    "lat": 41.66259576280344,
    "lon": -91.53460014176162,
    "heading": 181.31683011701875
}
"""
