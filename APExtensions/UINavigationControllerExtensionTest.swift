//
//  UINavigationControllerExtensionTest.swift
//  APExtensions
//
//  Created by Pino, Angelo on 31/07/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import XCTest

class UINavigationControllerExtensionTest: XCTestCase {
    
    var navigationViewController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        navigationViewController = UINavigationController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRootViewController() {
        navigationViewController.rootViewController = UIViewController()
        let viewController = navigationViewController.rootViewController
        XCTAssert(viewController != nil)
    }
    
    func testNilRootViewController() {
        navigationViewController.rootViewController = nil
        let viewController = navigationViewController.rootViewController
        XCTAssert(viewController == nil)
    }
    
    func testPopToViewController() {
        let firstViewController = FirstViewController(),
            secondViewController = SecondViewController(),
            thirdViewController = ThirdViewController(),
            fourthViewController = FourthViewController()
        
        navigationViewController.rootViewController = firstViewController
        firstViewController.navigationController?.pushViewController(secondViewController, animated: false)
        secondViewController.navigationController?.pushViewController(thirdViewController, animated: false)
        thirdViewController.navigationController?.pushViewController(fourthViewController, animated: false)
        
        let popController = fourthViewController.navigationController?.popToViewController(viewControllerType: SecondViewController.self, animated: false)
        
        XCTAssert(popController is SecondViewController)
    }
    
    func testNilPopToViewController() {
        let firstViewController = FirstViewController(),
        secondViewController = SecondViewController()
        
        navigationViewController.rootViewController = firstViewController
        firstViewController.navigationController?.pushViewController(secondViewController, animated: false)
        
        let popController = secondViewController.navigationController?.popToViewController(viewControllerType: ThirdViewController.self, animated: false)
        
        XCTAssert(popController == nil)
    }
    
}

fileprivate class FirstViewController: UIViewController {}
fileprivate class SecondViewController: UIViewController {}
fileprivate class ThirdViewController: UIViewController {}
fileprivate class FourthViewController: UIViewController {}
