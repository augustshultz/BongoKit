//
//  Created by August Shultz on 1/25/19.
//

import Foundation

private enum BongoURL {
    case routeInfo(Int)
    case routeList
    case predictions(Int)
    case stopList
    case stopInfo(Int)
    case buses(Int)

    var url: URL {
        URL(string: "https://api.bongo.org/\(pathComponent)")!
    }

    private var pathComponent: String {
        switch self {
        case .routeInfo(let routeId):
            return "routes/\(routeId)"
        case .routeList:
            return "routes/"
        case .predictions(let stopId):
            return "predictions/\(stopId)"
        case .stopList:
            return "stops/"
        case .stopInfo(let stopId):
            return "stops/\(stopId)"
        case .buses(let routeId):
            return "buses/\(routeId)"
        }
    }
}

typealias StopId = Int
typealias RouteId = Int

extension URL {
    static func bongoRouteInfo(route: RouteId) -> URL {
        return BongoURL.routeInfo(route).url
    }
    
    static var bongoRouteList: URL {
        return BongoURL.routeList.url
    }
    
    static func bongoPredictions(for stop: StopId) -> URL {
        return BongoURL.predictions(stop).url
    }
    
    static var bongoStopList: URL {
        return BongoURL.stopList.url
    }
    
    static func bongoStopInfo(for stop: StopId) -> URL {
        return BongoURL.stopInfo(stop).url
    }
    
    static func bongoBuses(for route: RouteId) -> URL {
        return BongoURL.buses(route).url
    }
}
