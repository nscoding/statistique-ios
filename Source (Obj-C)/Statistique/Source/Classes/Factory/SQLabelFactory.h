//
//  SQLabelFactory.h
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//


@interface SQLabelFactory : NSObject

+ (UILabel *)boldLabelForString:(NSString *)text;
+ (UILabel *)normalLabelForString:(NSString *)text;

@end
