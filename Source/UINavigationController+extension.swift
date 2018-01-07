//
//  UINavigationController+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 31/07/2017.
//  Copyright © 2017 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    public var rootViewController : UIViewController? {
        set {
            guard let rootVC = newValue else { return }
            setViewControllers([rootVC], animated: false)
        }
        get {
            return viewControllers.first
        }
    }
    
    @discardableResult
    public func popToViewController(viewControllerType: UIViewController.Type, animated: Bool = true) -> UIViewController? {
        for viewController in viewControllers {
            if viewController.isKind(of: viewControllerType) {
                popToViewController(viewController, animated: true)
                return viewController
            }
        }
        return nil
    }
    
    public func index(of type: UIViewController.Type)-> Int? {
        return viewControllers.index(where: { Swift.type(of: $0) == type })
    }
}

