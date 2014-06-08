//
//  CGRect+Helpers.swift
//  Statistique
//
//  Created by Patrick Chamelo on 08/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import Foundation
import UIKit

extension CGRect
{    
    func flooredRect(rect: CGRect) -> CGRect
    {
        return CGRect(x: floorf(rect.origin.x), y: floorf(rect.origin.y), width: rect.size.width, height: rect.origin.y)
    }
    
    func ceiledRect(rect: CGRect) -> CGRect
    {
        return CGRect(x: ceilf(rect.origin.x), y: ceilf(rect.origin.y), width: rect.size.width, height: rect.origin.y)
    }
}
