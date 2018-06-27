//
//  ScaleAnimator.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 27/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

class ScaleAnimator: BaseAnimator {

    override init(with direction: CustomPresentationDirection?, duration: TimeInterval?, interactionController: UIPercentDrivenInteractiveTransition?) {
        super.init()
    }
    
    override func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration ?? 0.5
    }
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewController(forKey: .to)!
        let from = transitionContext.viewController(forKey: .from)!
        let container = from.view.superview
        let originalCenter = from.view.center
        
        to.view.transform = CGAffineTransform(scaleX: 0.00, y: 0.00)
        to.view.center = originalCenter
        
        container?.addSubview(to.view)
        
        UIView.animate(withDuration: duration!, delay: 0, options: .curveEaseInOut, animations: {
            to.view.transform = .identity
        },
        completion: { success in
            transitionContext.completeTransition(true)
        })

    }
}



