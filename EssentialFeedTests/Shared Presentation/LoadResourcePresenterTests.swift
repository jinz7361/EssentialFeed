//
//  LoadResourcePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Jin Zhang on 7/8/24.
//

import XCTest
import EssentialFeed

class LoadResourcePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.message.isEmpty, "Expected no view messages")
    }
    
    func test_didStartLoading_displayNoErrorMessageAndStartsLoading() {
        let (sut, view) = makeSUT()
        sut.didStartLoading()
        XCTAssertEqual(view.message, [
            .display(errorMessage: .none),
            .display(isLoading: true)
        ])
    }
    
    func test_didFinishLoadingResource_displaysResourceAndStopsLoading() {
        let (sut, view) = makeSUT(mapper: { resource in
            resource + " view model"
        })
        
        sut.didFinishLoading(with: "resource")
        
        XCTAssertEqual(view.message, [
            .display(resourceViewModel: "resource view model"),
            .display(isLoading: false)
        ])
    }
    
    func test_didFinishLoadingFeedWithError_displaysLocalizedErrorMesageAndStopsLoading() {
        let (sut, view) = makeSUT()
        
        sut.didFinishLoading(with: anyNSError())
        
        XCTAssertEqual(view.message, [
            .display(errorMessage: localized("GENERIC_CONNECTION_ERROR")),
            .display(isLoading: false)
        ])
    }
    
    // MARK: - Helpers
    private typealias SUT = LoadResourcePresenter<String, ViewSpy>
    
    private func makeSUT(
        mapper: @escaping SUT.Mapper = { _ in "any" },
        file: StaticString = #file,
        line: UInt = #line
    ) -> (sut: SUT, view: ViewSpy) {
        let view = ViewSpy()
        let sut = LoadResourcePresenter(resourceView: view, loadingView: view, errorView: view, mapper: mapper)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Shared"
        let bundle = Bundle(for: SUT.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
    
    private class ViewSpy: ResourceView, FeedLoadingView, FeedErrorView {
        typealias ResourceViewModel = String
        
        enum Message: Hashable {
            case display(errorMessage: String?)
            case display(isLoading: Bool)
            case display(resourceViewModel: String)
        }
        
        private(set) var message = Set<Message>()
        
        func display(_ viewModel: FeedErrorViewModel) {
            message.insert(.display(errorMessage: viewModel.message))
        }
        
        func display(_ viewModel: FeedLoadingViewModel) {
            message.insert(.display(isLoading: viewModel.isLoading))
        }
        
        func display(_ viewModel: String) {
            message.insert(.display(resourceViewModel: viewModel))
        }
    }
}
