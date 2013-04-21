//
//  SQDeviceHelper.h
//  Statistique
//
//  Created by Patrick on 4/21/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//



@interface SQDeviceHelper : NSObject

+ (NSString *)titleForRow:(NSUInteger)row;
+ (NSString *)deviceInformationForRow:(NSUInteger)row;

+ (CGFloat)batteryPercetange;
+ (CGFloat)batteryLeft;
+ (NSString *)batteryPercetangeString;

@end
