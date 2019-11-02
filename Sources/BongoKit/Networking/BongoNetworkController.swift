//
//  Created by August Shultz on 1/6/19.
//

import Foundation

public enum StopsError: Error {
  case failedToFetchStops
}

public enum PredictionsError: Error {
  case failedToFetchPredictions
}

public class BongoNetworkController {

  private let session = URLSession.shared

  public init() {}

  public func fetchStops(_ result: @escaping (Result<[Stop], Error>) -> Void) {
    let dataTask = session.dataTask(with: BongoURL.stopList.url) { (data, _, error) in
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

  public func fetchPredictions(forStopNumber stopNumber: Int,
                               inTimeInterval interval: Int = 60,
                               _ result: @escaping (Result<[Prediction], Error>) -> Void) {
    let dataTask = session.dataTask(with: BongoURL.predictions(stopNumber).url) { (data, _, error) in
      if let error = error {
        result(.failure(error))
        return
      }
      guard let data = data else {
        result(.failure(PredictionsError.failedToFetchPredictions))
        return
      }
      do {
        let decoder = JSONDecoder()
        let predictions = try decoder.decode([Prediction].self, from: data)
        result(.success(predictions.filter { $0.minutes <= interval }))
      } catch let error {
        result(.failure(error))
        return
      }
    }
    dataTask.resume()
  }
}
