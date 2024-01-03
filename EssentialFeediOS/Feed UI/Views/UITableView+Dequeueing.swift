//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Jin Zhang on 1/2/24.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
