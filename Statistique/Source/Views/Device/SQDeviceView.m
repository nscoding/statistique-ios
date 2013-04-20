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

    
//        @property(nonatomic,readonly,retain) NSString    *name;              // e.g. "My iPhone"
//        @property(nonatomic,readonly,retain) NSString    *model;             // e.g. @"iPhone", @"iPod touch"
//        @property(nonatomic,readonly,retain) NSString    *localizedModel;    // localized version of model
//        @property(nonatomic,readonly,retain) NSString    *systemName;        // e.g. @"iOS"
//        @property(nonatomic,readonly,retain) NSString    *systemVersion;     // e.g. @"4.0"

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
