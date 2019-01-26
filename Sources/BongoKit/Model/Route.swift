//
//  Created by August Shultz on 1/24/19.
//

import Foundation

public struct Route: Decodable {
  public let id: Int
  public let name: String
  public let shortname: String
  public let color: String
  public let agency: String
}
