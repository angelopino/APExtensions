//
//  DoubleExtensionTest.swift
//  APJExtensionsiOSTests
//
//  Created by Angelo Pino on 23/04/2020.
//  Copyright © 2020 Pino, Angelo. All rights reserved.
//

import XCTest

class DoubleExtensionTest: XCTestCase {

    func testFormatUsingAbbrevation() {
        XCTAssertEqual(598.0.formatUsingAbbrevation, "598")
        XCTAssertEqual(Double(-999).formatUsingAbbrevation, "-999")
        XCTAssertEqual(1000.0.formatUsingAbbrevation, "1K")
        XCTAssertEqual(Double(-1284).formatUsingAbbrevation, "-1.3K")
        XCTAssertEqual(9940.0.formatUsingAbbrevation, "9.9K")
        XCTAssertEqual(9980.0.formatUsingAbbrevation, "10K")
        XCTAssertEqual(39900.0.formatUsingAbbrevation, "39.9K")
        XCTAssertEqual(99880.0.formatUsingAbbrevation, "99.9K")
        XCTAssertEqual(399880.0.formatUsingAbbrevation, "0.4M")
        XCTAssertEqual(999898.0.formatUsingAbbrevation, "1M")
        XCTAssertEqual(999999.0.formatUsingAbbrevation, "1M")
        XCTAssertEqual(1456384.0.formatUsingAbbrevation, "1.5M")
        XCTAssertEqual(12383474.0.formatUsingAbbrevation, "12.4M")
        XCTAssertEqual(Double(-12383474.0).formatUsingAbbrevation, "-12.4M")
    }
    
}
