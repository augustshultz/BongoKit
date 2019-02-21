//
//  Created by August Shultz on 1/6/19.
//

import Foundation
import CommandKit

class BongoNetworkController {
  
  private let session = URLSession.shared
  private let jsonDecoder = JSONDecoder()
  
  func stops() -> [Stop] {
    return fetch(fromUrl: BongoURL.stopList.url)
  }
  
  func predictions(forStopNumber stopNumber: Int, inTimeInterval interval: Int = 60) -> [Prediction] {
    return fetch(fromUrl: BongoURL.predictions(stopNumber).url).filter { $0.minutes < interval }
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
  
  private func fetch<T: Decodable>(fromUrl url: URL) -> [T] {
    let response = session.synchronousDataTask(with: url)
    return decode(fromData: response.0!)
  }
}
