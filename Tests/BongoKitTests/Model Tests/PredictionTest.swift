//
//  Created by August Shultz on 3/5/19.
//

import XCTest
@testable import BongoKit

private let json = """
                   {
                       "routeid":2326,
                       "name":"Lantern Park",
                       "shortname":"lanternpark",
                       "busid":3274,
                       "busnumber":"114",
                       "seconds":707,
                       "minutes":12,
                       "agency":"coralville",
                       "agencyname":"Coralville Transit"
                   }
                   """

class PredictionTest: XCTestCase {

    let jsonDecoder = JSONDecoder()
    var prediction: Prediction?

    override func setUp() {
        prediction = try? jsonDecoder.decode(Prediction.self, from: json.data(using: .utf8)!)
    }

    func testPredictionNameDecode() {
        XCTAssertEqual(prediction!.name, "Lantern Park")
    }

    func testPredictionShortNameDecode() {
        XCTAssertEqual(prediction!.shortName, "lanternpark")
    }

    func testPredictionAdencyNameDecode() {
        XCTAssertEqual(prediction!.agencyName, "Coralville Transit")
    }
}
