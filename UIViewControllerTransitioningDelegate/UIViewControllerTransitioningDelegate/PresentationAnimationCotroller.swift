//
//  PresentationAnimationCotroller.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by Damon Cricket on 29.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class PresentationAnimationCotroller: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(0.8)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as! PresentViewController
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
        toViewController.blindView?.alpha = 0.0
        toViewController.menuViewCenterYConstraint?.constant = (toViewController.view.frame.height + toViewController.blindView!.frame.height)/2.0
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: duration/2.0, animations: {
            toViewController.blindView?.alpha = 0.5
        }, completion: {finished in
            UIView.animate(withDuration: duration/2.0, animations: {
                toViewController.menuViewCenterYConstraint?.constant = 0.0
                toViewController.view.layoutIfNeeded()
            }, completion: {finished in
                transitionContext.completeTransition(finished)
            })
        })
    }
}
