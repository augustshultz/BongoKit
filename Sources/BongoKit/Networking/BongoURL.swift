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
  
  var url: URL {
    switch self {
    case .routeInfo(let routeId):
      return URL(string: "https://api.bongo.org/routes/\(routeId)")!
    case .routeList:
      return URL(string: "https://api.bongo.org/routes/")!
    case .predictions(let stopId):
      return URL(string: "https://api.bongo.org/predictions/\(stopId)")!
    case .stopList:
      return URL(string: "https://api.bongo.org/stops")!
    case .stopInfo(let stopId):
      return URL(string: "https://api.bongo.org/stops/\(stopId)")!
    case .buses(let routeId):
      return URL(string: "https://api.bongo.org/buses/\(routeId)")!
    }
  }
}
