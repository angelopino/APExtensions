//
//  UIViewControllerExtensionTest.swift
//  APJExtensionsiOSTests
//
//  Created by Pino, Angelo on 02/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import XCTest

class UIViewControllerExtensionTest: XCTestCase {
    
    var storyboard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        storyboard = UIStoryboard(name: "Storyboard", bundle: bundle)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInstantiateFromStoryboard() {
        let controllerWithStoryboard = OneNavigationViewController.instantiateFromStoryboard(storyboard)
        XCTAssertNotNil(controllerWithStoryboard)
        
        let controllerWithoutStoryboard = OneNavigationViewController.instantiateFromStoryboard()
        XCTAssertNil(controllerWithoutStoryboard)
        
    }
    
    func testPerformSegue() {
        
        let controllerWithStoryboard = OneNavigationViewController.instantiateFromStoryboard(storyboard) as? OneNavigationViewController
        XCTAssertNotNil(controllerWithStoryboard)
        controllerWithStoryboard?.rootViewController?.performSegueWithClassName(withController: TwoViewController.self)
        
        let segues = controllerWithStoryboard?.rootViewController?.value(forKey: "storyboardSegueTemplates") as? [AnyObject],
            segueExist = segues?.contains(where: { (segue) -> Bool in
                let identifier = segue.value(forKey: "identifier") as? String
                return identifier == TwoViewController.className
            }) ?? false
        XCTAssert(segueExist)
    }
    
}
