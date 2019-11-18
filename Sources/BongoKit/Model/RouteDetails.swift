//
//  Created by August on 11/17/19.
//

import Foundation
import MapKit

public struct RouteDetails: Decodable {
    public let route: Route
    public let stops: [Stop]
//    public let maxLatitude: CLLocationDegrees
//    public let minLatitude: CLLocationDegrees
//    public let maxLongitude: CLLocationDegrees
//    public let minLongitude: CLLocationDegrees
//    public let path: [CLLocationCoordinate2D]
    
    enum CodingKeys: String, CodingKey {
        case route, stops
    }

    public init(from decoder: Decoder) throws {
        route = try Route(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stops = try container.decode([Stop].self, forKey: .stops)
    }
}
