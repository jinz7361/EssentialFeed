//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 10/14/23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
