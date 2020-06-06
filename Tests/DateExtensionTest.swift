//
//  DateExtensionTest.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 16/08/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest

class DateExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToString() {
        let dateString = "30/10/1987",
            dateFormat = "dd/MM/yyyy",
            dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = dateFormat
        var date = dateFormatter.date(from: dateString)!

        XCTAssertEqual(dateString, date.toString(dateFormat))
        
        let locale = Locale(identifier: "it_IT"),
            localeDate = "Fri, 06 Jan 2017",
            localeFormat = "E, dd MMM yyyy",
            localeForCheck = "ven, 06 gen 2017"
        
        dateFormatter.dateFormat = localeFormat
        date = dateFormatter.date(from: localeDate)!
        
        XCTAssertEqual(localeForCheck, date.toString(localeFormat, locale: locale))
    }
    
    func testIsEqualComponent() {
        let dateString = "30/10/2020",
            dateStringToEqual = "01/01/2020",
            dateFormat = "dd/MM/yyyy",
            dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateString)!,
            dateToEqual = dateFormatter.date(from: dateStringToEqual)!
        
        XCTAssertTrue(date.isEqual(to: dateToEqual, toGranularity: .year))
        XCTAssertFalse(date.isEqual(to: Date(), toGranularity: .month))
    }
    
    func testIsEqualComponents() {
        let dateString = "30/10/2020",
            dateStringToEqual = "01/10/2020",
            dateFormat = "dd/MM/yyyy",
            dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateString)!,
            dateToEqual = dateFormatter.date(from: dateStringToEqual)!
        
        XCTAssertTrue(date.isEqual(to: dateToEqual, toGranularity: [.month, .year]))
        XCTAssertFalse(date.isEqual(to: dateToEqual, toGranularity: [.day, .year]))
    }
    
    func testIsToday() {
        let todayDate = Date(),
        wrongTodayDate = Calendar.current.date(byAdding: .day, value: 5, to: todayDate)
        print("\(todayDate.toString("dd/MM/yyyy")) - \(wrongTodayDate!.toString("dd/MM/yyyy"))")
        XCTAssertTrue(todayDate.isToday)
        XCTAssertFalse(wrongTodayDate!.isToday)
    }
    
}
