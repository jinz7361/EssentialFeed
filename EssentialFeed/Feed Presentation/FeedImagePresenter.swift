//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 1/14/24.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
