//
//  Created by August Shultz on 1/6/19.
//

import Foundation
import NetworkKit
import Codextended

public class BongoNetworkController {

  private let session = URLSession.shared
  private let jsonDecoder = JSONDecoder()

  public init() {}

  public func synchronouslyFetchStops() -> [Stop] {
    return synchronouslyFetch(fromUrl: BongoURL.stopList.url)
  }

  public func synchronouslyFetchPredictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60) -> [Prediction] {
    let predictions: [Prediction] = synchronouslyFetch(fromUrl: BongoURL.predictions(stopNumber).url)
    let predictionsInTimeInterval = predictions.filter { $0.minutes < interval }
    return predictionsInTimeInterval
  }

  private func synchronouslyFetch<T: Decodable>(fromUrl url: URL) -> [T] {
    let response = session.synchronousDataTask(with: url)
    var decodedResponse: [T] = []
    do {
      decodedResponse = try response.0!.decoded() as [T]
    } catch let error as NSError {
      print("\(error)")
    }
    return decodedResponse
  }
}
