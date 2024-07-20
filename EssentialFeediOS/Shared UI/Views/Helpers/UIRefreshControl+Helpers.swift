//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Jin Zhang on 1/9/24.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
