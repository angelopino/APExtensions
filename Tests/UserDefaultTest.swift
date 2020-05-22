//
//  UserDefaultTest.swift
//  APJExtensionsiOSTests
//
//  Created by Angelo Pino on 22/05/2020.
//  Copyright © 2020 Pino, Angelo. All rights reserved.
//

import XCTest

class UserDefaultTest: XCTestCase {
    
    struct TestModel {
        @UserDefault("firstname", defaultValue: "Giuseppe")
        var firstname: String?
        
        @UserDefault("lastname", defaultValue: "Rossi")
        var lastname: String?
    }

    func testUserDefault() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var model = TestModel()
        model.firstname = nil
        XCTAssertEqual(model.firstname, "Giuseppe")
        XCTAssertEqual(model.lastname, "Rossi")
        model.firstname = "Mario"
        XCTAssertEqual(model.firstname, "Mario")
        
        let model2 = TestModel()
        XCTAssertEqual(model2.firstname, "Mario")
        
        UserDefaults.standard.set(2, forKey: "firstname")
        XCTAssertEqual(model2.firstname, "Giuseppe")
    }

}



