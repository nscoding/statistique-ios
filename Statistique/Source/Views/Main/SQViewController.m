//
//  SQViewController.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQViewController.h"
#import "SQMemoryView.h"


// ------------------------------------------------------------------------------------------


#define kLinesOfPages 2


// ------------------------------------------------------------------------------------------


@interface SQViewController ()


- (void)buildAndConfigure;
- (void)buildAndConfigureScrollView;
- (void)buildAndConfigurePageControl;


@end


@implementation SQViewController


// ------------------------------------------------------------------------------------------
#pragma mark - View did load
// ------------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Pattern"]];
    
    [self buildAndConfigure];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Build and Configure
// ------------------------------------------------------------------------------------------
- (void)buildAndConfigure
{
    [self buildAndConfigureScrollView];
    [self buildAndConfigurePageControl];
}


- (void)buildAndConfigureScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2,
                                             self.view.frame.size.height);
    
    SQMemoryView *memoryView = [[SQMemoryView alloc] initWithFrame:self.view.bounds];
    [self.scrollView addSubview:memoryView];
    
    [self.view addSubview:self.scrollView];
}


- (void)buildAndConfigurePageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.numberOfPages = kLinesOfPages;
    
    CGSize sizeForControl = [self.pageControl sizeForNumberOfPages:kLinesOfPages];
    CGRect frame = self.pageControl.frame;
    
    frame.size = sizeForControl;
    frame.origin = CGPointMake((self.view.frame.size.width / 2) - (sizeForControl.width / 2),
                                self.view.frame.size.height - 50);
    
    self.pageControl.frame = frame;
    
    [self.view addSubview:self.pageControl];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Scroll View delegate
// ------------------------------------------------------------------------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
    NSInteger page = (sender.contentOffset.x / self.view.frame.size.width);
    [self.pageControl setCurrentPage:page];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Memory warning
// ------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
