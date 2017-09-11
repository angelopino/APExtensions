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
    
}
