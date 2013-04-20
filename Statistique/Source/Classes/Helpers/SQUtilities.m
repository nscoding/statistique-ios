//
//  SQUtilities.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQUtilities.h"


// ------------------------------------------------------------------------------------------


@implementation SQUtilities


+ (CGRect)floorRect:(CGRect)rect
{
    return CGRectMake(floorf(rect.origin.x),
                      floorf(rect.origin.y),
                      floorf(rect.size.width),
                      floorf(rect.size.height));
}


+ (CGRect)floorOriginForRect:(CGRect)rect
{
    return CGRectMake(floorf(rect.origin.x),
                      floorf(rect.origin.y),
                      (rect.size.width),
                      (rect.size.height));
}


+ (CGRect)ceilRect:(CGRect)rect
{
    return CGRectMake(ceilf(rect.origin.x),
                      ceilf(rect.origin.y),
                      ceilf(rect.size.width),
                      ceilf(rect.size.height));
}


+ (CGRect)ceilOriginForRect:(CGRect)rect
{
    return CGRectMake(ceilf(rect.origin.x),
                      ceilf(rect.origin.y),
                      (rect.size.width),
                      (rect.size.height));
}


@end
