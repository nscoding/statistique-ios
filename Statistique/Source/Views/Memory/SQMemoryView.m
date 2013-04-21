//
//  SQMemoryView.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQMemoryView.h"
#import "SQMemoryHelper.h"
#import "SQLabelFactory.h"
#import "SQUtilities.h"


// ------------------------------------------------------------------------------------------


#define kNumberOfIndicators 4
#define kProgressStartingY 119
#define kBoldLabelStartingY 93


// ------------------------------------------------------------------------------------------


@implementation SQMemoryView


// ------------------------------------------------------------------------------------------
#pragma mark - Initializer
// ------------------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.backgroundColor = [UIColor clearColor];

        // instantiate the arrays
        progressIndicators = [[NSMutableArray alloc] init];
        valueLabels = [[NSMutableArray alloc] init];
        
        // build
        [self buildAndConfigure];
        
        // schedule the timer
        [[NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(refreshMemory:)
                                       userInfo:nil
                                        repeats:YES] fire];
    }
    
    return self;
}


// ------------------------------------------------------------------------------------------
#pragma mark - Refresh memory
// ------------------------------------------------------------------------------------------
- (void)refreshMemory:(NSTimer *)timer
{
    // get the total
    float totalMemory = [SQMemoryHelper memoryForOption:SQMemoryOptionAll];
    
    
    // iterate thru the indicators
    for (NSInteger count = 0; count < kNumberOfIndicators; count++)
    {
        UILabel *rightLabel = [valueLabels objectAtIndex:count];
        rightLabel.text = [SQMemoryHelper stringMemoryForOption:count];
        [rightLabel sizeToFit];
        
        rightLabel.frame = CGRectMake(self.frame.size.width - 20 - rightLabel.frame.size.width,
                                      kBoldLabelStartingY + (count * 52),
                                      rightLabel.frame.size.width,
                                      rightLabel.frame.size.height);
        
        rightLabel.frame = [SQUtilities floorOriginForRect:rightLabel.frame];

        
        // get the right indicator
        UIProgressView *progressView = [progressIndicators objectAtIndex:count];
        
        // get the memory for the current progress view
        NSUInteger memory = [SQMemoryHelper memoryForOption:count];
        
        // set the progress
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
        UILabel *leftLabel = [SQLabelFactory boldLabelForString:[SQMemoryHelper stringHeaderForOption:count]];
        
        leftLabel.frame = CGRectMake(20, kBoldLabelStartingY + (count * 52),
                                 leftLabel.frame.size.width,
                                 leftLabel.frame.size.height);
        
        leftLabel.frame = [SQUtilities floorOriginForRect:leftLabel.frame];
        
        [self addSubview:leftLabel];
        
        
        UILabel *rightLabel = [SQLabelFactory normalLabelForString:[SQMemoryHelper stringMemoryForOption:count]];
        
        rightLabel.frame = CGRectMake(self.frame.size.width - 20 - rightLabel.frame.size.width,
                                      kBoldLabelStartingY + (count * 52),
                                      rightLabel.frame.size.width,
                                      rightLabel.frame.size.height);
        
        rightLabel.frame = [SQUtilities floorOriginForRect:rightLabel.frame];
        
        [self addSubview:rightLabel];
        [valueLabels addObject:rightLabel];
        

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
    [[UIImage imageNamed:@"PanelMemory"] drawAtPoint:CGPointMake(0, 38)];
    [[UIImage imageNamed:@"HeaderMemory"] drawAtPoint:CGPointMake(40, 49)];
}


@end
