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
}
