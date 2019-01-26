//
//  Created by August Shultz on 1/25/19.
//

import Foundation

public struct BongoURL {
  private static let baseURLString = "https://api.bongo.org/"
  
  public let routeListURL = URL(string: baseURLString + "routes")
  
  func routeInfoURL(<#parameters#>) -> <#return type#> {
    <#function body#>
  }
}
