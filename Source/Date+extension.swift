//
//  Date+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 16/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Date {

    func toString(_ format: String, locale: Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
    
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    
    func isEqual(to date: Date, toGranularity components: [Calendar.Component], in calendar: Calendar = .current) -> Bool {
        return !components.contains { !calendar.isDate(self, equalTo: date, toGranularity: $0) }
    }
    
}
