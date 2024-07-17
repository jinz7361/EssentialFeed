//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 1/14/24.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
