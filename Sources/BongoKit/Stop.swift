//
//  Created by August Shultz on 1/3/19.
//

import Foundation

public struct Stop: Decodable {
  let id: String
  public let name: String
  public let lat: Float
  public let lon: Float
}
