//
//  SQViewController.m
//  Statistique
//
//  Created by Patrick on 4/20/13.
//  Copyright (c) 2013 Patrick Chamelo - nscoding. All rights reserved.
//

#import "SQViewController.h"
#import "SQMemoryView.h"
#import "SQDeviceView.h"


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
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    self.scrollView.showsVerticalScrollIndicator = FALSE;

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2,
                                             self.view.frame.size.height);
    

    SQMemoryView *memoryView = [[SQMemoryView alloc] initWithFrame:self.view.bounds];
    [self.scrollView addSubview:memoryView];

    SQDeviceView *deviceView = [[SQDeviceView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0,
                                                                              self.view.bounds.size.width,
                                                                              self.view.bounds.size.height)];
    
    [self.scrollView addSubview:deviceView];

    [self.view addSubview:self.scrollView];
}


- (void)buildAndConfigurePageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.numberOfPages = kLinesOfPages;
    
    [self.pageControl addTarget:self
                         action:@selector(changePage:)
               forControlEvents:UIControlEventTouchUpInside];
    
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = ceil(scrollView.contentOffset.x / self.view.frame.size.width);
    [self.pageControl setCurrentPage:page];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Actions
// ------------------------------------------------------------------------------------------
- (IBAction)changePage:(UIPageControl *)sender
{
    NSInteger page = sender.currentPage;
    CGFloat x = page * self.view.frame.size.width;
    
    [self.scrollView scrollRectToVisible:CGRectMake(x, 0,
                                                    self.view.frame.size.width,
                                                    self.view.frame.size.height)
                                animated:YES];
    
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
