//
//  UITableView+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 07/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register(cellName: String, bundle: Bundle? = nil) {
        let uiNib = UINib(nibName: cellName, bundle: bundle)
        register(uiNib, forCellReuseIdentifier: cellName)
    }
    
    func register(cellNames: [String], bundle: Bundle? = nil) {
        cellNames.forEach { self.register(cellName: $0, bundle: bundle) }
    }
}
