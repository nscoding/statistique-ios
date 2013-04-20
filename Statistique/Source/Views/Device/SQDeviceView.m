//
//  SQDeviceView.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQDeviceView.h"


// ------------------------------------------------------------------------------------------


@implementation SQDeviceView


// ------------------------------------------------------------------------------------------
#pragma mark - Draw rect
// ------------------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"PanelDevice"] drawAtPoint:CGPointMake(0, 0)];
    [[UIImage imageNamed:@"HeaderDevice"] drawAtPoint:CGPointMake(40, 49)];
}

@end
