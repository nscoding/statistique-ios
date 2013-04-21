//
//  SQDeviceHelper.m
//  Statistique
//
//  Created by Patrick on 4/21/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQDeviceHelper.h"
#import "SQUtilities.h"

// ------------------------------------------------------------------------------------------


@implementation SQDeviceHelper


+ (NSString *)titleForRow:(NSUInteger)row
{
    switch (row)
    {
        case 0:
            return NSLocalizedString(@"Name", @"");
            break;
        case 1:
            return NSLocalizedString(@"Model", @"");
            break;
        case 2:
            return NSLocalizedString(@"System Name", @"");
            break;
        case 3:
            return NSLocalizedString(@"System Version", @"");
            break;     
        default:
            break;
    }
    
    return @"";
}


+ (NSString *)deviceInformationForRow:(NSUInteger)row
{
    switch (row)
    {
        case 0:
            return [[UIDevice currentDevice] name];
            break;
        case 1:
            return [[UIDevice currentDevice] model];
            break;
        case 2:
            return [[UIDevice currentDevice] systemName];
            break;
        case 3:
            return [[UIDevice currentDevice] systemVersion];
            break;
        default:
            break;
    }
    
    return @"";
}


+ (CGFloat)batteryPercetange
{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    CGFloat batteryLevel = [[UIDevice currentDevice] batteryLevel];
    CGFloat batteryPercent = (batteryLevel * 100);
    
    return batteryPercent;
}


+ (CGFloat)batteryLeft
{
    CGFloat batteryPercetange = [SQDeviceHelper batteryPercetange];
    CGFloat batteryLeft = batteryPercetange / 100;
    
    return batteryLeft;
}


+ (NSString *)batteryPercetangeString
{
    return [NSString stringWithFormat:@"%i%%",(int)[SQDeviceHelper batteryPercetange]];
}

@end
