//
//  SQMemoryView.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQMemoryView.h"
#import "SQMemoryHelper.h"

// ------------------------------------------------------------------------------------------


#define kNumberOfIndicators 4
#define kProgressStartingY 119


// ------------------------------------------------------------------------------------------


@implementation SQMemoryView


// ------------------------------------------------------------------------------------------
#pragma mark - Initializer
// ------------------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        progressIndicators = [[NSMutableArray alloc] init];
        valueLabels = [[NSMutableArray alloc] init];
        
        [self buildAndConfigure];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(refreshMemory:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    return self;
}


- (void)refreshMemory:(NSTimer *)timer
{
    float totalMemory = [SQMemoryHelper memoryForOption:SQMemoryOptionAll];
    for (NSInteger count = 0; count < kNumberOfIndicators; count++)
    {
        UIProgressView *progressView =
        [progressIndicators objectAtIndex:count];
        
        NSUInteger memory = [SQMemoryHelper memoryForOption:count];
        progressView.progress = (float) (memory / totalMemory);
    }
}


// ------------------------------------------------------------------------------------------
#pragma mark - Build and Configure
// ------------------------------------------------------------------------------------------
- (void)buildAndConfigure
{
    for (NSInteger count = 0; count < kNumberOfIndicators; count++)
    {
        UIProgressView *progressView = [[UIProgressView alloc]
                                        initWithProgressViewStyle:UIProgressViewStyleBar];
        
        progressView.frame = CGRectMake(20, kProgressStartingY + (count * 52), 280, 11);

        [self addSubview:progressView];
        [progressIndicators addObject:progressView];
    }
}


// ------------------------------------------------------------------------------------------
#pragma mark - Draw rect
// ------------------------------------------------------------------------------------------
- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"PanelMemory"] drawAtPoint:CGPointMake(0, 0)];
}


@end
