//
//  SQDeviceHelper.m
//  Statistique
//
//  Created by Patrick on 4/21/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQDeviceHelper.h"


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




- (NSNumber *)totalDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager]
                                 attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}


- (NSNumber *)freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager]
                                 attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}


@end
