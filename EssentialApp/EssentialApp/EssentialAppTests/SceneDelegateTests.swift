//
//  SceneDelegateTests.swift
//  EssentialAppTests
//
//  Created by Jin Zhang on 6/13/24.
//

import XCTest
import EssentialFeediOS
@testable import EssentialApp

class SceneDelegateTests: XCTestCase {
    func test_configureWindow_setsWindowAsKeyAndVisible() {
        let window = UIWindow()
        window.windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sut = SceneDelegate()
        sut.window = window
        
        sut.configureWindow()
        
        XCTAssertTrue(window.isKeyWindow, "Expected window to be the key window")
        XCTAssertFalse(window.isHidden, "Expected window to be visible")
    }
    
    func test_configureWindow_configuresRootViewController() {
        let sut = SceneDelegate()
        sut.window = UIWindow()
        
        sut.configureWindow()
        
        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController
        
        XCTAssertNotNil(rootNavigation, "Expected a navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is FeedViewController, "Expected a feed controller as top view controller, got \(String(describing: topController)) instead")
    }
}
