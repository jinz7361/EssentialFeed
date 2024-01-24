//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 1/23/24.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
