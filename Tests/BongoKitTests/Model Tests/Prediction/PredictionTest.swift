//
//  Created by August Shultz on 3/5/19.
//

import XCTest
@testable import BongoKit

class PredictionTest: XCTestCase {

    func testPredictionNameDecode() throws {
        let json = try Data(fromJsonFileNamed: "single_prediction", forBundle: Bundle(for: type(of: self)))
        let prediction = try JSONDecoder().decode(Prediction.self, from: json)
        XCTAssertEqual(prediction.name, "Lantern Park")
    }

    func testPredictionShortNameDecode() throws {
        let json = try Data(fromJsonFileNamed: "single_prediction", forBundle: Bundle(for: type(of: self)))
        let prediction = try JSONDecoder().decode(Prediction.self, from: json)
        XCTAssertEqual(prediction.shortName, "lanternpark")
    }

    func testPredictionAdencyNameDecode() throws {
        let json = try Data(fromJsonFileNamed: "single_prediction", forBundle: Bundle(for: type(of: self)))
        let prediction = try JSONDecoder().decode(Prediction.self, from: json)
        XCTAssertEqual(prediction.agencyName, "Coralville Transit")
    }
}
