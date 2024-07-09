//
//  LoadResourcePresenter.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 7/8/24.
//

import Foundation

public protocol ResourceView {
    func display(_ viewModel: String)
}

public final class LoadResourcePresenter {
    public typealias Mapper = (String) -> String
    
    private let resourceView: ResourceView
    private let errorView: FeedErrorView
    private let loadingview: FeedLoadingView
    private let mapper: Mapper
    
    private var feedLoadError: String {
        return NSLocalizedString("FEED_VIEW_CONNECTION_ERROR",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    public init(resourceView: ResourceView, loadingView: FeedLoadingView, errorView: FeedErrorView, mapper: @escaping Mapper) {
        self.resourceView = resourceView
        self.loadingview = loadingView
        self.errorView = errorView
        self.mapper = mapper
    }
    
    public func didFinishLoading(with resource: String) {
        resourceView.display(mapper(resource))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
    
    public func didStartLoading() {
        errorView.display(.noError)
        loadingview.display(FeedLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoadingFeed(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
}
