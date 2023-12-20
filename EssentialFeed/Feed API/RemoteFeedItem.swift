//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 12/14/23.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
