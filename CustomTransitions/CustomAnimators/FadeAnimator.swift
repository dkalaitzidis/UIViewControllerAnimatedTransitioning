//
//  FadeAnimator.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 26/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

class FadeAnimator: BaseAnimator {
    
    public override init(with direction: CustomPresentationDirection? = .top,
                         duration: TimeInterval? = 0.5,
                         interactionController:UIPercentDrivenInteractiveTransition? = nil) {
        
        super.init(with: direction, duration: duration, interactionController: interactionController)
    }
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let from = transitionContext.viewController(forKey: .from)!
        let to = transitionContext.viewController(forKey: .to)!
        let final = transitionContext.finalFrame(for: to)
        let container = transitionContext.containerView
        
        to.view.frame = direction!.offsetWithFrame(viewFrame: final)
        container.addSubview(to.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        from.view.alpha = 0.25
                        to.view.frame = final
                        
        }) { (finished) in
            transitionContext.completeTransition(true)
            from.view.alpha = 1.0
        }
    }
    
}
