//
//  SQBaseView.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQBaseView.h"


// ------------------------------------------------------------------------------------------


@implementation SQBaseView


// ------------------------------------------------------------------------------------------
#pragma mark - Draw rect
// ------------------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect
{
    [self.pageImage drawAtPoint:CGPointMake(0, 38)];
    [self.headerImage drawAtPoint:CGPointMake(40, 49)];
}

@end
