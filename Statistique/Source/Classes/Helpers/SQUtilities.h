//
//  SQUtilities.h
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//


@interface SQUtilities : NSObject

+ (CGRect)floorRect:(CGRect)rect;
+ (CGRect)floorOriginForRect:(CGRect)rect;
+ (CGRect)ceilRect:(CGRect)rect;
+ (CGRect)ceilOriginForRect:(CGRect)rect;
+ (CGRect)screenRect;

@end
