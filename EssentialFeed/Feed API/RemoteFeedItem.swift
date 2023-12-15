//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 12/14/23.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
