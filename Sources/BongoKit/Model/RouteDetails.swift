//
//  Created by August on 11/17/19.
//

import Foundation
import MapKit

public struct RouteDetails: Decodable {
    public let route: Route
    public let stops: [Stop]
    public let maxLatitude: CLLocationDegrees
    public let minLatitude: CLLocationDegrees
    public let maxLongitude: CLLocationDegrees
    public let minLongitude: CLLocationDegrees
    public let path: [CLLocationCoordinate2D]

    enum CodingKeys: String, CodingKey {
        case route, stops, maxLatitude = "maxlat", minLatitude = "minlat", maxLongitude = "maxlon", minLongitude = "minlon", path = "paths"
    }

    public init(from decoder: Decoder) throws {
        route = try Route(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stops = try container.decode([Stop].self, forKey: .stops)
        maxLatitude = try container.decode(CLLocationDegrees.self, forKey: .maxLatitude)
        minLatitude = try container.decode(CLLocationDegrees.self, forKey: .minLatitude)
        maxLongitude = try container.decode(CLLocationDegrees.self, forKey: .maxLongitude)
        minLongitude = try container.decode(CLLocationDegrees.self, forKey: .minLongitude)
        let paths = try container.decode([[String: [Dictionary[String: CLLocationDegrees]]>].self, forKey: .path)
        var decodedPaths: [CLLocationCoordinate2D] = []
        if let points = paths[0]["points"] {
            for point in points {
                guard let latitude = point["lat"], let longitude = point["lon"] else {
                    continue
                }
                decodedPaths.append(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            }
        }
        path = decodedPaths
    }
}
