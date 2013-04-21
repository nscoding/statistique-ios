//
//  SQDeviceView.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQDeviceView.h"
#import "SQLabelFactory.h"
#import "SQUtilities.h"
#import "SQDeviceHelper.h"


// ------------------------------------------------------------------------------------------


#define kBoldLabelStartingY 93


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

        [self buildAndConfigure];
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Build and Configure
// ------------------------------------------------------------------------------------------
- (void)buildAndConfigure
{
    for (NSInteger count = 0; count < 5; count++)
    {
        UILabel *leftLabel = [SQLabelFactory boldLabelForString:[SQDeviceHelper titleForRow:count]];
        
        leftLabel.frame = CGRectMake(20, kBoldLabelStartingY + (count * 27),
                                     leftLabel.frame.size.width,
                                     leftLabel.frame.size.height);
        
        leftLabel.frame = [SQUtilities floorOriginForRect:leftLabel.frame];
        
        [self addSubview:leftLabel];
        
        
        UILabel *rightLabel = [SQLabelFactory normalLabelForString:[SQDeviceHelper deviceInformationForRow:count]];
        
        rightLabel.frame = CGRectMake(self.frame.size.width - 20 - rightLabel.frame.size.width,
                                      kBoldLabelStartingY + (count * 27),
                                      rightLabel.frame.size.width,
                                      rightLabel.frame.size.height);
        
        rightLabel.frame = [SQUtilities floorOriginForRect:rightLabel.frame];
        
        [self addSubview:rightLabel];
    }
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
