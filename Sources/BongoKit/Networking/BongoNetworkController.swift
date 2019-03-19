//
//  Created by August Shultz on 1/6/19.
//

import Foundation
import NetworkKit

public class BongoNetworkController {

  private let session = URLSession.shared
  private let jsonDecoder = JSONDecoder()

  public init() {}

  public func synchronouslyFetchStops() -> [Stop] {

    let stops: [Stop] = synchronouslyFetch(fromUrl: BongoURL.stopList.url)

    return stops
  }

  public func synchronouslyFetchPredictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60) -> [Prediction] {

    let predictions: [Prediction] = synchronouslyFetch(fromUrl: BongoURL.predictions(stopNumber).url)
    let predictionsInTimeInterval = predictions.filter { $0.minutes < interval }

    return predictionsInTimeInterval
  }

  private func decode<T: Decodable>(fromData data: Data) -> [T] {

    var decoded: [T] = []

    do {
      decoded = try jsonDecoder.decode([T].self, from: data)
    } catch let error as NSError {
      print("\(error)")
    }

    return decoded
  }

  private func synchronouslyFetch<T: Decodable>(fromUrl url: URL) -> [T] {

    let response = session.synchronousDataTask(with: url)
    let decodedResponse: [T] = decode(fromData: response.0!)

    return decodedResponse
  }
}
