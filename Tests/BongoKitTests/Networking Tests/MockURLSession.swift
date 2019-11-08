//
//  Created by August Shultz on 11/2/19.
//  Copyright © 2019 August Shultz. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    var cachedUrl: URL?
    private let mockDockTask: MockDataTask

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {

        mockDockTask = MockDataTask(data: data, urlResponse: urlResponse, error: error)
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        self.cachedUrl = url
        mockDockTask.completionHandler = completionHandler
        return mockDockTask
    }
}
