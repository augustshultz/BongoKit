//
//  Created by August Shultz on 1/6/19.
//

import Foundation

public enum BongoError: Error {
    case fetchFailedToReturnAnyData
}

public class BongoNetworkController {

    private let session: URLSession

    public init(session: URLSession = URLSession.shared, baseUrl: URL = URL(string: "https://api.bongo.org")!) {
        self.session = session
    }

    public func fetchStops(_ result: @escaping (Result<[Stop], Error>) -> Void) {
        fetch([Stop].self, fromUrl: .bongoStopList, result)
    }

    public func fetchDetails(forRoute route: Int, _ result: @escaping (Result<RouteDetails, Error>) -> Void) {
        fetch(RouteDetails.self, fromUrl: .bongoRouteInfo(route: route), result)
    }

    public func fetchRoutes(_ result: @escaping (Result<[Route], Error>) -> Void) {
        fetch([Route].self, fromUrl: .bongoRouteList, result)
    }

    public func fetchPredictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60, _ result: @escaping (Result<[Prediction], Error>) -> Void) {
        fetch([Prediction].self, fromUrl: .bongoPredictions(for: stopNumber)) { (fetchResult) in
            switch fetchResult {
            case .success(let predictions):
                result(.success(predictions.filter {
                    $0.minutes <= interval
                }))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }

    func fetch<T: Decodable>(_ type: T.Type, fromUrl url: URL, _ result: @escaping (Result<T, Error>) -> Void) {
        let dataTask = session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                result(.failure(BongoError.fetchFailedToReturnAnyData))
                return
            }
            do {
                let decoder = JSONDecoder()
                result(.success(try decoder.decode(type, from: data)))
            } catch let error {
                result(.failure(error))
                return
            }
        }
        dataTask.resume()
    }
}
