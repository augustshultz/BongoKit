import XCTest
@testable import BongoKit

final class BongoKitTests: XCTestCase {
  
  func testDecodePrediction() {
    let json = "{\"routeid\":2326,\"name\":\"Lantern Park\",\"shortname\":\"lanternpark\",\"busid\":3274,\"busnumber\":\"114\",\"seconds\":707,\"minutes\":12,\"agency\":\"coralville\",\"agencyname\":\"Coralville Transit\"}"
    
    let jsonDecoder = JSONDecoder()
    let prediction: Prediction? = try? jsonDecoder.decode(Prediction.self, from: json.data(using: .utf8)!)
    
    XCTAssertEqual(prediction!.name, "Lantern Park")
  }

    static var allTests = [
        ("testExample", testDecodePrediction)
    ]
}
