//
//  Created by August Shultz on 1/3/19.
//

import Foundation

public struct Stop: Decodable {
    public let stopId: String
    public let name: String
    public let lat: Float
    public let lon: Float

    private enum CodingKeys: String, CodingKey {
        case name, lat, lon, stopId = "id"
    }
}
