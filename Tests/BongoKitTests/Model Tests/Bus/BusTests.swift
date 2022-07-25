//
//  Created by August Shultz on 11/1/19.
//

import XCTest

@testable import BongoKit

class BusTests: XCTestCase {

    func testDecodeBusJson() throws {
        let decoder = JSONDecoder()
        let json = try Data(fromJsonFileNamed: "single_bus")
        let actual = try decoder.decode(Bus.self, from: json)
        XCTAssertEqual(actual.id, 2915)
    }
}
