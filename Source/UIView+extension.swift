//
//  UIView+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 01/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIView {

    func removeSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func loadViewFromNib(_ nibName: String? = nil) -> UIView? {
        guard let nibObjects = Bundle(for: type(of: self)).loadNibNamed(nibName ?? className, owner: self, options: nil) else { return nil }
        return nibObjects.first as? UIView
    }
    
    func bindFrameToSuperviewBounds(marginLeft: CGFloat = 0, marginRight: CGFloat = 0, marginTop: CGFloat = 0, marginBottom: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        let views = ["subview": self]
        translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(marginLeft)-[subview]-\(marginRight)-|", metrics: nil, views: views))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(marginTop)-[subview]-\(marginBottom)-|", metrics: nil, views: views))
    }

    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
