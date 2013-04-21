//
//  SQDeviceView.h
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//


@interface SQDeviceView : UIView
{
    CGFloat chargeFactor;
}

@property (nonatomic, strong) UIProgressView *batteryProgressView;
@property (nonatomic, strong) UILabel *batteryPercentageLabel;

@end
