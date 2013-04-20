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
#pragma mark - Initializer
// ------------------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}



// ------------------------------------------------------------------------------------------
#pragma mark - Draw rect
// ------------------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"PanelDevice"] drawAtPoint:CGPointMake(0, 38)];
    [[UIImage imageNamed:@"HeaderDevice"] drawAtPoint:CGPointMake(40, 49)];
}

@end
