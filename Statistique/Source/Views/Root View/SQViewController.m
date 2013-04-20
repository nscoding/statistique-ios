//
//  SQViewController.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQViewController.h"


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

    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2,
                                               self.view.frame.size.height);
    
    [self.view addSubview:self.scrollView];
}


- (void)buildAndConfigurePageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 25,
                                                                        self.view.frame.size.height - 50,
                                                                        50, 20)];
    self.pageControl.numberOfPages = 2;
    
    [self.view addSubview:self.pageControl];
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
