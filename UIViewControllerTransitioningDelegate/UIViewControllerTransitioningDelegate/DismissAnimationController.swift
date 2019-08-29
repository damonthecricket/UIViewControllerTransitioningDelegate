//
//  DismissAnimationController.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by Damon Cricket on 29.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class DismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(0.8)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as! PresentViewController
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration/2.0, animations: {
            fromViewController.menuViewCenterYConstraint?.constant = (fromViewController.view.frame.height + fromViewController.menuView!.frame.height)/2.0
            fromViewController.view.layoutIfNeeded()
        }, completion: {finished in
            UIView.animate(withDuration: duration/2.0, animations: {
                fromViewController.blindView?.alpha = 0.0
            }, completion: {finished in
                transitionContext.completeTransition(finished)
            })
        })
    }
}
