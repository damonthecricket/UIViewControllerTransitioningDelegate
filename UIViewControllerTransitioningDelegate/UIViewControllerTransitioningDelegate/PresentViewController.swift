//
//  PresentViewController.swift
//  UIViewControllerTransitioningDelegate
//
//  Created by Damon Cricket on 29.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
    
    @IBOutlet weak var blindView: UIView?
    @IBOutlet weak var menuView: UIView?
    @IBOutlet weak var menuViewCenterYConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        menuView?.layer.cornerRadius = 10.0
    }
    
    @IBAction func hideButtonTap(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
