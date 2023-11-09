//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Jin Zhang on 11/9/23.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        // We are asserting that we didn't make a URL request since
        // that should only happen when '.load()' is invoked.
        XCTAssertNil(client.requestedURL)
    }
}
