//
//  UIView+Helpers.swift
//  Statistique
//
//  Created by Patrick Chamelo on 08/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func left() -> CGFloat
    {
        return self.frame.origin.x
    }

    func right() -> CGFloat
    {
        return CGRectGetMaxX(self.frame)
    }
    
    func top() -> CGFloat
    {
        return self.frame.origin.y
    }

    func bottom() -> CGFloat
    {
        return CGRectGetMaxY(self.frame)
    }
    
    func width() -> CGFloat
    {
        return CGRectGetWidth(self.frame)
    }
    
    func height() -> CGFloat
    {
        return CGRectGetHeight(self.frame)
    }
}
