//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 10/14/23.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
