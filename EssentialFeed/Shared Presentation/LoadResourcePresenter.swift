//
//  LoadResourcePresenter.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 7/8/24.
//

import Foundation

public final class LoadResourcePresenter {
    private let feedView: FeedView
    private let errorView: FeedErrorView
    private let loadingview: FeedLoadingView
    
    private var feedLoadError: String {
        return NSLocalizedString("FEED_VIEW_CONNECTION_ERROR",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    public init(feedView: FeedView, loadingView: FeedLoadingView, errorView: FeedErrorView) {
        self.feedView = feedView
        self.loadingview = loadingView
        self.errorView = errorView
    }
    
    public static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
    
    // data in -> creates view models -> data out to the UI
    
    // [FeedImage] -> creates view models -> sends to the UI
    // [ImageComments] -> creates view models -> sends to the UI
    // Data -> UIImage -> send to the UI
    // Resource -> creates ResourceViewModel -> sends to the UI
    public func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
    
    // Void -> creates view models -> sends to the UI
    public func didStartLoadingFeed() {
        errorView.display(.noError)
        loadingview.display(FeedLoadingViewModel(isLoading: true))
    }
    
    // Errors -> creates view models -> sends to the UI
    public func didFinishLoadingFeed(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
}
