//
//  Created by August Shultz on 11/3/19.
//  Copyright © 2019 August Shultz. All rights reserved.
//

import Foundation

class MockDataTask: URLSessionDataTask {

    private let data: Data?
    private let urlResponse: URLResponse?
    private let mockError: Error?

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        mockError = error
        super.init()
    }

    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.data, self.urlResponse, self.mockError)
        }
    }
}
