//
//  Created by August Shultz on 1/25/19.
//

import Foundation

public enum BongoURL {
  case routeInfo(Int)
  case routeList
  case predictions(Int)
  case stopList
  case stopInfo(Int)
  case buses(Int)

  public var url: URL {
    return URL(string: "https://api.bongo.org/\(pathComponent)")!
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
