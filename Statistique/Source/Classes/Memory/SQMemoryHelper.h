//
//  SQMemoryHelper.h
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//


typedef enum
{
    SQMemoryOptionFree = 0,
    SQMemoryOptionInactive,
    SQMemoryOptionActive,
    SQMemoryOptionWired,
    SQMemoryOptionAll
} SQMemoryOption;


@interface SQMemoryHelper : NSObject

+ (NSUInteger)memoryForOption:(SQMemoryOption)option;
+ (NSString *)stringMemoryForOption:(SQMemoryOption)option;

@end
