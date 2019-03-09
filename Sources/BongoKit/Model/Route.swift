//
//  Created by August Shultz on 1/24/19.
//

import Foundation

public struct Route: Decodable {
  public let id: Int
  public let name: String
  public let shortName: String
  public let color: String
  public let agency: String
  public let agencyName: String

  private enum CodingKeys: String, CodingKey {
    case id, name, shortName = "shortname", color, agency, agencyName = "agencyname"
  }
}
