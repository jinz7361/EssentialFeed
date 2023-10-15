//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 10/14/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
