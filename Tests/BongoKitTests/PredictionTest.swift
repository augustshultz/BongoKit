//
//  Created by August Shultz on 3/5/19.
//

import XCTest
@testable import BongoKit

class PredictionTest: XCTestCase {
  
  let json = "{\"routeid\":2326,\"name\":\"Lantern Park\",\"shortname\":\"lanternpark\",\"busid\":3274,\"busnumber\":\"114\",\"seconds\":707,\"minutes\":12,\"agency\":\"coralville\",\"agencyname\":\"Coralville Transit\"}"
  let jsonDecoder = JSONDecoder()
  var prediction: Prediction?
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    prediction = try? jsonDecoder.decode(Prediction.self, from: json.data(using: .utf8)!)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testPredictionNameDecode() {    
    XCTAssertEqual(prediction!.name, "Lantern Park")
  }
  
  func testPredictionShortNameDecode() {
    XCTAssertEqual(prediction!.shortName, "lanternpark")
  }
  
}
