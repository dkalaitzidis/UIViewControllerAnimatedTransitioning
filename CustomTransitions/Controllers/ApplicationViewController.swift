//
//  ApplicationViewController.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 26/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var customPresent:BaseAnimator = ScaleAnimator(with: nil, duration: 0.5, interactionController: nil)
    var customDismiss:BaseAnimator = BaseAnimator(with: .bottom)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.transitioningDelegate = self

        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresent
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismiss
    }

}
