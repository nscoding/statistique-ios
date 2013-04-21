//
//  SQLabelFactory.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQLabelFactory.h"


// ------------------------------------------------------------------------------------------


@implementation SQLabelFactory


+ (UILabel *)boldLabelForString:(NSString *)text
{
    UILabel *label = [SQLabelFactory labelForString:text];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]];
    [label setTextAlignment:NSTextAlignmentLeft];
    
    return label;
}


+ (UILabel *)normalLabelForString:(NSString *)text
{
    UILabel *label = [SQLabelFactory labelForString:text];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:14]];
    [label setTextAlignment:NSTextAlignmentRight];

    return label;
}


+ (UILabel *)labelForString:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor colorWithRed:0.839f green:0.839f blue:0.839f alpha:1.00f]];
    [label setShadowColor:[UIColor colorWithWhite:0.0 alpha:1.0]];
    [label setShadowOffset:CGSizeMake(0, 1)];
    [label setText:text];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setNumberOfLines:0];
    [label sizeToFit];

    return label;
}


@end
