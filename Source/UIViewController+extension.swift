//
//  UIViewController+extension.swift
//  APJExtensionsiOS
//
//  Created by Pino, Angelo on 02/01/2018.
//  Copyright © 2018 Pino, Angelo. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func performSegueWithClassName(withController controller: UIViewController.Type, sender: Any? = nil) {
        performSegue(withIdentifier: controller.className, sender: nil)
    }

    public static func instantiateFromStoryboard(_ storyboard: UIStoryboard? = nil, with identifier: String? = nil) -> UIViewController? {
        let sb = storyboard ?? UIApplication.shared.keyWindow?.rootViewController?.storyboard
        let controllerIdentifier = identifier ?? className
        return sb?.instantiateViewController(withIdentifier: controllerIdentifier)
    }

    public func modalPresent(_ modalTransitionStyle: UIModalTransitionStyle = .coverVertical, modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.modalTransitionStyle = modalTransitionStyle
        self.modalPresentationStyle = modalPresentationStyle
        let topController = UIApplication.shared.keyWindow?.topController
        topController?.present(self, animated: animated) { [weak self] in
            self?.modalPresentationCapturesStatusBarAppearance = true
            self?.setNeedsStatusBarAppearanceUpdate()
            completion?()
        }
    }
}
