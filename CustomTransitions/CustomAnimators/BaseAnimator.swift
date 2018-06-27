//
//  BaseAnimator.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 26/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

class BaseAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var direction: CustomPresentationDirection?
    var duration: TimeInterval?
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    public init(with direction: CustomPresentationDirection? = nil,
                duration:TimeInterval? = 0.8,
                interactionController: UIPercentDrivenInteractiveTransition? = nil){
        
        self.direction = direction
        self.duration = duration
        self.interactionController = interactionController
        
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration ?? 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let to = transitionContext.viewController(forKey: .to)!
        let final = transitionContext.finalFrame(for: to)
        let container = transitionContext.containerView
        
        to.view.frame = direction!.offsetWithFrame(viewFrame: final)
        container.addSubview(to.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
                        to.view.frame = final
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }

}
