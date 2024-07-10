//
//  LoadResourcePresenter.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 7/8/24.
//

import Foundation

public protocol ResourceView {
    associatedtype ResourceViewModel
    
    func display(_ viewModel: ResourceViewModel)
}

public final class LoadResourcePresenter<Resource, View: ResourceView> {
    public typealias Mapper = (Resource) -> View.ResourceViewModel
    
    private let resourceView: View
    private let errorView: FeedErrorView
    private let loadingview: FeedLoadingView
    private let mapper: Mapper
    
    private var feedLoadError: String {
        return NSLocalizedString("GENERIC_CONNECTION_ERROR",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    public init(resourceView: View, loadingView: FeedLoadingView, errorView: FeedErrorView, mapper: @escaping Mapper) {
        self.resourceView = resourceView
        self.loadingview = loadingView
        self.errorView = errorView
        self.mapper = mapper
    }
    
    public func didFinishLoading(with resource: Resource) {
        resourceView.display(mapper(resource))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
    
    public func didStartLoading() {
        errorView.display(.noError)
        loadingview.display(FeedLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoading(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingview.display(FeedLoadingViewModel(isLoading: false))
    }
}
