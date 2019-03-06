//
//  Created by August Shultz on 1/1/19.
//

import Foundation

public struct Prediction: Decodable {
  public let name: String
  public let minutes: Int
  public let shortName: String

  enum CodingKeys: String, CodingKey {
    case name, minutes, shortName = "shortname"
  }
}
