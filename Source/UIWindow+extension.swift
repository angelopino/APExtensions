//
//  UIWindow+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 03/12/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIWindow {
    
    var topController: UIViewController? {
        if var topController = rootViewController {
            while let presentedViewController = topController.presentedViewController, !(presentedViewController is UIAlertController) {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool = true, duration: TimeInterval = 0.5, options: UIView.AnimationOptions = .transitionFlipFromRight, completion: (() -> Void)? = nil) {
        
        let replaceCallback: () -> Void = {
            self.rootViewController?.removeFromParent()
            self.rootViewController?.view.removeFromSuperview()
            self.rootViewController = nil
            self.rootViewController = replacementController
        }
        
        let completionCallback: (Bool) -> Void = { (Bool) in
            replacementController.modalPresentationCapturesStatusBarAppearance = true
            replacementController.setNeedsStatusBarAppearanceUpdate()
            completion?()
        }
        
        if animated {
            UIView.transition(with: self, duration: duration, options: options, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                replaceCallback()
                UIView.setAnimationsEnabled(oldState)
            }, completion: completionCallback)
        } else {
            replaceCallback()
            completionCallback(true)
        }
    }
}
