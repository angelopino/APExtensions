//
//  StringExtensionTest.swift
//  APJExtensionsiOSTests
//
//  Created by Angelo Pino on 20/05/2019.
//  Copyright © 2019 Pino, Angelo. All rights reserved.
//

import XCTest

class StringExtensionTest: XCTestCase {

    
    func testIsNotEmpty() {
        let stringNotEmpty = "asdasd",
            stringEmpty = ""
        XCTAssertTrue(stringNotEmpty.isNotEmpty)
        XCTAssertNotEqual(stringNotEmpty.isNotEmpty, stringEmpty.isNotEmpty)
    }
    
    func testRegex() {
        let regex = "^\\d+"
        let stringToBeTest = "1234"
        
        XCTAssertTrue(stringToBeTest.test(regex: regex))
        
    }
    
    func testCountRegex() {
        let regex = "^\\d+"
        let stringToBeTest = "1234"
        let count = stringToBeTest.count(regex: regex)
        XCTAssertTrue(count > 0)
    }
    
    func testToInt() {
        let intString = "34"
        XCTAssertEqual(intString.toInt, 34)
        
        // fail test
        let failString = "asd3"
        XCTAssertEqual(failString.toInt, nil)
    }
    
    func testToDate() {
        let dateString = "3/19/20",
            dateFromString = dateString.toDate("MM/dd/yy")
        
        XCTAssertNotNil(dateFromString)
        
        let calendar = Calendar.current,
            year = calendar.component(.year, from: dateFromString!),
            month = calendar.component(.month, from: dateFromString!),
            day = calendar.component(.day, from: dateFromString!)
        XCTAssertEqual(2020, year)
        XCTAssertEqual(3, month)
        XCTAssertEqual(19, day)
    }
    
    func testLastDayToDate() {
        let dateString = "12/31/2021",
            dateFromString = dateString.toDate("MM/dd/yyyy")
        
        XCTAssertNotNil(dateFromString)
        
        let calendar = Calendar.current,
            year = calendar.component(.year, from: dateFromString!),
            month = calendar.component(.month, from: dateFromString!),
            day = calendar.component(.day, from: dateFromString!)
        XCTAssertEqual(2021, year)
        XCTAssertEqual(12, month)
        XCTAssertEqual(31, day)
    }
    
    func testFirstDayToDate() {
        let dateString = "1/1/2021",
            dateFromString = dateString.toDate("MM/dd/yyyy")
        
        XCTAssertNotNil(dateFromString)
        
        let calendar = Calendar.current,
            year = calendar.component(.year, from: dateFromString!),
            month = calendar.component(.month, from: dateFromString!),
            day = calendar.component(.day, from: dateFromString!)
        XCTAssertEqual(2021, year)
        XCTAssertEqual(1, month)
        XCTAssertEqual(1, day)
    }
    
    func testFailToDate() {
        let dateString = "3/19/20",
            dateFromString = dateString.toDate("wrongFormat")
        
        XCTAssertNil(dateFromString)
    }
    
    func testToImange() {
        let imageString = "mosquito",
        imageFromString = imageString.toImage
        
        let image = UIImage(named: "mosquito", in: Bundle(for: type(of: self)), with: nil)
        XCTAssertNotNil(image)
    }
}
