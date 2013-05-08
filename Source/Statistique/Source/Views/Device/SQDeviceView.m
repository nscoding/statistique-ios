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
        self.pageImage = [UIImage imageNamed:@"PanelDevice"];

        NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
        self.headerImage = [UIImage imageNamed:[@"Device" stringByAppendingString:[language uppercaseString]]];

        // fallback
        if (self.headerImage == nil)
        {
            self.headerImage = [UIImage imageNamed:@"Device"];
        }
        
        [self buildAndConfigure];
        
        // schedule the timer
        [[NSTimer scheduledTimerWithTimeInterval:1.0
                                          target:self
                                        selector:@selector(refreshBattery:)
                                        userInfo:nil
                                         repeats:YES] fire];

    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Refresh memory
// ------------------------------------------------------------------------------------------
- (void)refreshBattery:(NSTimer *)timer
{
    self.batteryPercentageLabel.text = [SQDeviceHelper batteryPercetangeString];
    CGSize batterySize = [self.batteryPercentageLabel sizeThatFits:CGSizeMake(FLT_MAX, FLT_MAX)];
    self.batteryPercentageLabel.frame = CGRectMake(self.frame.size.width - 20 -
                                                   batterySize.width, 230,
                                                   batterySize.width,
                                                   batterySize.height);
    self.batteryPercentageLabel.frame = [SQUtilities floorOriginForRect:self.batteryPercentageLabel.frame];

	
	if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging)
    {
		[self.batteryProgressView setProgress:chargeFactor];
        
        // simulate charging
		chargeFactor = 	chargeFactor + 0.05f;
        
        // stay a bit on 100% and start over
		if (chargeFactor > 1.10f)
        {
            chargeFactor = 0.0f;
        }
	}
	else
    {
        [self.batteryProgressView setProgress:[SQDeviceHelper batteryLeft]];
	}
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
    
    
    // add the battery title label
    UILabel *batteryLabel = [SQLabelFactory boldLabelForString:NSLocalizedString(@"label_battery", @"")];
    batteryLabel.frame = CGRectMake(20, 230,
                                 batteryLabel.frame.size.width,
                                 batteryLabel.frame.size.height);
    
    batteryLabel.frame = [SQUtilities floorOriginForRect:batteryLabel.frame];
    
    [self addSubview:batteryLabel];
    
    // add the battery label
    self.batteryPercentageLabel = [SQLabelFactory normalLabelForString:[SQDeviceHelper batteryPercetangeString]];
    self.batteryPercentageLabel.frame = CGRectMake(self.frame.size.width - 20 -
                                                   self.batteryPercentageLabel.frame.size.width, 230,
                                                   self.batteryPercentageLabel.frame.size.width,
                                                   self.batteryPercentageLabel.frame.size.height);
                    
    self.batteryPercentageLabel.frame = [SQUtilities floorOriginForRect:self.batteryPercentageLabel.frame];
    [self addSubview:self.batteryPercentageLabel];

    // add the battery bar
    self.batteryProgressView = [[UIProgressView alloc]
                                    initWithProgressViewStyle:UIProgressViewStyleBar];
    self.batteryProgressView.frame = CGRectMake(20, 260, 280, 11);
    [self addSubview:self.batteryProgressView];
}


@end
