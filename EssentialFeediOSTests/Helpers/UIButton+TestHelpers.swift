//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Jin Zhang on 12/28/23.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
