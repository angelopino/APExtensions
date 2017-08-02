//
//  UIView+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 01/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIView {

    public func removeSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    public func loadViewFromNib(_ nibName: String? = nil) -> UIView? {
        guard let nibObjects = Bundle.main.loadNibNamed(nibName ?? className, owner: self, options: nil) else { return nil }
        return nibObjects.first as? UIView
    }
}
