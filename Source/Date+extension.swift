//
//  Date+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 16/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Date {

    public func toString(_ format: String, locale: Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
    
}
