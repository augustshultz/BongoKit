//
//  Created by August Shultz on 1/6/19.
//

import Foundation
import NetworkKit

public enum StopsError: Error {
  case failedToFetchStops
}

public class BongoNetworkController {

  private let session = URLSession.shared

  public init() {}

  public func synchronouslyFetchStops() -> [Stop] {
    return synchronouslyFetch(fromUrl: BongoURL.stopList.url)
  }
  
  public func fetchStops(_ result: @escaping (Result<[Stop], Error>) -> Void) {
    let dataTask = session.dataTask(with: BongoURL.stopList.url) { (data, response, error) in
      if let error = error {
        result(.failure(error))
        return
      }
      guard let data = data else {
        result(.failure(StopsError.failedToFetchStops))
        return
      }
      do {
        let decoder = JSONDecoder()
        let stops = try decoder.decode([Stop].self, from: data)
        result(.success(stops))
      } catch let error as NSError {
        result(.failure(error))
      }
    }
    dataTask.resume()
  }

  public func synchronouslyFetchPredictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60) -> [Prediction] {
    let predictions: [Prediction] = synchronouslyFetch(fromUrl: BongoURL.predictions(stopNumber).url)
    let predictionsInTimeInterval = predictions.filter { $0.minutes < interval }
    return predictionsInTimeInterval
  }

  private func synchronouslyFetch<T: Decodable>(fromUrl url: URL) -> [T] {
    let response = session.synchronousDataTask(with: url)
    guard let data = response.0 else {
      return []
    }
    var decodedResponse: [T] = []
    do {
      let decoder = JSONDecoder()
      decodedResponse = try decoder.decode([T].self, from: data)
    } catch let error as NSError {
      print("\(error)")
    }
    return decodedResponse
  }
}
