//
//  IntExtensionTest.swift
//  APExtensions
//
//  Created by Pino, Angelo on 31/07/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest

class IntExtensionTest: XCTestCase {
    
    func testIntToString() {
        let val = 10.string
        XCTAssert(val == "10", "Convert Int to String")
    }
    
    func testIntToCGFloat() {
        let val = 10.cgFloat
        XCTAssert(val == CGFloat(10), "Convert Int to CGFloat")
    }
    
    func testIntToDouble() {
        let val = 10.double
        XCTAssert(val == Double(10), "Convert Int to Double")
    }
    
    func testIntToFloat() {
        let val = 10.float
        XCTAssert(val == Float(10), "Convert Int to Float")
    }
    
}
