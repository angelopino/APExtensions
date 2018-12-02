//
//  UIWindow+extension.swift
//  APJExtensions
//
//  Created by Pino, Angelo on 03/12/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIWindow {
    public func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion:(() -> Void)?) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)
        if let presented = self.rootViewController?.presentedViewController {
            presented.dismiss(animated: false, completion: { [weak self] in
                guard let _self = self else {
                    return
                }
                _self._replace(replacementController, snapshotImageView: snapshotImageView, animated: animated, completion: completion)
            })
        }
        else {
            self._replace(replacementController, snapshotImageView: snapshotImageView, animated: animated, completion: completion)
        }
    }
    
    // MARK: private methods
    private func _replace(_ replacementController: UIViewController, snapshotImageView: UIImageView, animated: Bool, completion: (() -> Void)?) {
        self.rootViewController?.removeFromParentViewController()
        self.rootViewController?.view.removeFromSuperview()
        self.rootViewController = nil
        self.rootViewController = replacementController
        self.bringSubview(toFront: snapshotImageView)
        
        let completionCallback: (Bool) -> Void = { (Bool) in
            snapshotImageView.removeFromSuperview()
            replacementController.modalPresentationCapturesStatusBarAppearance = true
            replacementController.setNeedsStatusBarAppearanceUpdate()
            completion?()
        }
        
        if animated {
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                snapshotImageView.alpha = 0
            }, completion: completionCallback)
        }
        else {
            completionCallback(true)
        }
    }
}
