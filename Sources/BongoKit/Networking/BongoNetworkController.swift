//
//  Created by August Shultz on 1/6/19.
//

import Foundation

public enum BongoError: Error {
    case failedToFetchStops, failedToFetchPredictions, failedToFetchRoutes
}

public class BongoNetworkController {

    private let session: URLSession

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public func fetchStops(_ result: @escaping (Result<[Stop], Error>) -> Void) {
        let dataTask = session.dataTask(with: BongoURL.stopList.url) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                result(.failure(BongoError.failedToFetchStops))
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

    public func fetchPredictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60, _ result: @escaping (Result<[Prediction], Error>) -> Void) {
        let dataTask = session.dataTask(with: BongoURL.predictions(stopNumber).url) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                result(.failure(BongoError.failedToFetchPredictions))
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

    public func fetchRoutes(_ result: @escaping (Result<[Route], Error>) -> Void) {
        let dataTask = session.dataTask(with: BongoURL.routeList.url) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                result(.failure(BongoError.failedToFetchRoutes))
                return
            }
            do {
                let decoder = JSONDecoder()
                let routes = try decoder.decode([Route].self, from: data)
                result(.success(routes))
            } catch let error {
                result(.failure(error))
                return
            }
        }
        dataTask.resume()
    }
}
