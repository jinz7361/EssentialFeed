//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Jin Zhang on 6/14/24.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
