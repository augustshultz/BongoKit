//
//  Created by August Shultz on 1/25/19.
//

import Foundation

public struct Bus {
  public let id: Int
  public let latitude: Int
  public let longitude: Int
  public let heading: Int

  private  enum CodingKeys: String, CodingKey {
    case id, latitude = "lat", longitude = "lon", heading
  }
}
