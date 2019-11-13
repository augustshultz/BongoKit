//
//  Created by August on 11/12/19.
//

import Foundation

extension Data {
    init(fromJsonFileNamed fileName: String, forBundle bundle: Bundle) throws {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw JsonDataError.couldNotFindFile
        }
        self = try Data(contentsOf: url)
    }
}

enum JsonDataError: Error {
    case couldNotFindFile
}
