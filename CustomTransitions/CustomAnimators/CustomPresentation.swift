//
//  CustomPresentation.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 26/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

enum CustomPresentationDirection {
    case top, bottom, left, right
    
    var bounds : CGRect {
        return UIScreen.main.bounds
    }
    
    func offsetWithFrame(viewFrame: CGRect) -> CGRect {
        switch self {
        case .top:
            return viewFrame.offsetBy(dx: 0, dy: -bounds.size.height)
        case .bottom:
            return viewFrame.offsetBy(dx: 0, dy: bounds.size.height)
        case .left:
            return viewFrame.offsetBy(dx: -bounds.size.width, dy: 0)
        case .right:
            return viewFrame.offsetBy(dx: bounds.size.width, dy: 0)
        }
    }
}
