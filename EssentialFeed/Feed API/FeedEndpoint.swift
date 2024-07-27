//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 7/27/24.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
