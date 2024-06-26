//
//  ErrorView.swift
//  EssentialFeediOS
//
//  Created by Jin Zhang on 1/9/24.
//

import UIKit

public final class ErrorView: UIView {
    @IBOutlet private(set) public var button: UIButton!

    public var message: String? {
        get { return isVisible ? button.title(for: .normal) : nil }
    }

    private var isVisible: Bool {
        return alpha > 0
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        button.setTitle(nil, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        alpha = 0
    }

    func show(message: String) {
        button.setTitle(message, for: .normal)

        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }

    @IBAction func hideMessage() {
        UIView.animate(
            withDuration: 0.25,
            animations: { self.alpha = 0 },
            completion: { completed in
                if completed {
                    self.button.setTitle(nil, for: .normal)
                }
            })
    }
}

