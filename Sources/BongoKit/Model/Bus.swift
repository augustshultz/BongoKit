//
//  Created by August Shultz on 1/25/19.
//

import Foundation

public struct Bus: Decodable {
    public let id: Int
    public let latitude: Double
    public let longitude: Double
    public let heading: Double

    private enum CodingKeys: String, CodingKey {
        case id, latitude = "lat", longitude = "lon", heading
    }
}
