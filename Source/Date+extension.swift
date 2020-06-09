//
//  Date+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 16/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension Date {
    
    var isToday: Bool {
        let todayDate = Date()
        return isEqual(to: todayDate, toGranularity: [.day, .month, .year])
    }
    
    var isEarlierThanToday: Bool {
        let diffDays = self.diffDays(from: Date())
        return diffDays < 0
    }
    
    var isAfterThanToday: Bool {
        let diffDays = Calendar.current.dateComponents([.day], from: Date(), to: self).day ?? 0
        return diffDays > 0
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var startOfMonth: Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)
        
        return  calendar.date(from: components)!
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
    }
    
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
    
    func adding(_ component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self) ?? self
    }
    
    func diffDays(from date: Date) -> Int {
        let diffDays = Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
        return diffDays
    }
    
}
