//
//  NSObject+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 01/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension NSObject {
    
    public var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    public class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
}
