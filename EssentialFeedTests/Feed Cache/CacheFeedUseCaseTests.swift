//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Jin Zhang on 12/13/23.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    private let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
    
    func save(_ items: [FeedItem]) {
        store.deleteCacheFeed()
    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
    
    func deleteCacheFeed() {
        deleteCacheFeedCallCount += 1
    }
}

class CacheFeedUseCaseTests: XCTestCase {
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }
    
    func test() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [uniqueItem(), uniqueItem()]
        
        sut.save(items)
        
        XCTAssertEqual(store.deleteCacheFeedCallCount, 1)
    }
    
    // MARK: -Helpers
    private func uniqueItem() -> FeedItem {
        return FeedItem(id: UUID(), description: "any", location: "any", imageURL: anyURL())
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
}
