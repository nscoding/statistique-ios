//
//  SQDeviceView.h
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQBaseView.h"

@interface SQDeviceView : SQBaseView
{
    CGFloat chargeFactor;
}

@property (nonatomic, strong) UIProgressView *batteryProgressView;
@property (nonatomic, strong) UILabel *batteryPercentageLabel;

@end
