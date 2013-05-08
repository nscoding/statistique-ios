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
#import "SQLabelFactory.h"
#import "SQUtilities.h"


// ------------------------------------------------------------------------------------------


#define kNumberOfPages 2


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
    
    [self.view setFrame:[[UIScreen mainScreen] applicationFrame]];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Pattern"]];
    [self buildAndConfigure];
    
    [self registerObservers];
}




// ------------------------------------------------------------------------------------------
#pragma mark - Register observers
// ------------------------------------------------------------------------------------------
- (void)registerObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    [UIView animateWithDuration:0.4f animations:^{
        self.footerLabel.alpha = 1.0f;
        self.pageControl.alpha = 0.0f;
    }];
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UIView animateWithDuration:0.4f animations:^{
        self.footerLabel.alpha = 0.0f;
        self.pageControl.alpha = 1.0f;
    }];
}


// ------------------------------------------------------------------------------------------
#pragma mark - Build and Configure
// ------------------------------------------------------------------------------------------
- (void)buildAndConfigure
{
    [self buildAndConfigureScrollView];
    [self buildAndConfigurePageControl];
    [self buildAndConfigureMadeWithLove];
    [self buildAndConfigureFooter];
}


- (void)buildAndConfigureScrollView
{
    // create the scroll view
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    // set the properties
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    self.scrollView.showsVerticalScrollIndicator = FALSE;

    // set the content size
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * kNumberOfPages,
                                             self.view.frame.size.height);
    
    CGRect frame = CGRectMake(0, 50,
                              self.view.bounds.size.width,
                              self.view.bounds.size.height - 50);
    
    // add the first view
    SQMemoryView *memoryView = [[SQMemoryView alloc] initWithFrame:frame];
    [self.scrollView addSubview:memoryView];

    // add the second view
    frame.origin.x = self.view.bounds.size.width;
    SQDeviceView *deviceView = [[SQDeviceView alloc] initWithFrame:frame];
    [self.scrollView addSubview:deviceView];
    
    // add the scroll view
    [self.view addSubview:self.scrollView];
}


- (void)buildAndConfigurePageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.numberOfPages = kNumberOfPages;
    
    [self.pageControl addTarget:self
                         action:@selector(changePage:)
               forControlEvents:UIControlEventTouchUpInside];
    
    CGSize sizeForControl = [self.pageControl sizeForNumberOfPages:kNumberOfPages];
    CGRect frame = self.pageControl.frame;
    
    frame.size = sizeForControl;
    frame.origin = CGPointMake((self.view.frame.size.width / 2) - (sizeForControl.width / 2),
                                [UIImage imageNamed:@"PanelDevice"].size.height + 100);
    
    self.pageControl.frame = frame;
    
    [self.view addSubview:self.pageControl];
}


- (void)buildAndConfigureMadeWithLove
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
    label.textColor = [UIColor colorWithRed:0.839f green:0.839f blue:0.839f alpha:1.00f];
    label.shadowColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    label.shadowOffset = CGSizeMake(0, 1);
    label.textAlignment = NSTextAlignmentCenter;
    label.text =  @"Made in Berlin with Love\n❝Patrick - Vasileia❞";
    label.numberOfLines = 0;
    
    [label sizeToFit];
    [label setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [label setCenter:CGPointMake(self.scrollView.contentSize.width + 50, self.view.center.y)];
    
    label.frame = [SQUtilities floorOriginForRect:label.frame];
    
    [self.scrollView addSubview:label];
}


- (void)buildAndConfigureFooter
{
    self.footerLabel = [SQLabelFactory normalLabelForString:NSLocalizedString(@"label_free_up", @"")];
    self.footerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
    self.footerLabel.textAlignment = NSTextAlignmentCenter;
    
    CGSize size = [self.footerLabel sizeThatFits:CGSizeMake(self.view.frame.size.width - 100, FLT_MAX)];
    
    self.footerLabel.frame = CGRectMake(50,
                                        self.view.frame.size.height - size.height - 30,
                                        self.view.frame.size.width - 100,
                                        size.height);
    
    self.footerLabel.alpha = 0.0f;
    [self.view addSubview:self.footerLabel];
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


// ------------------------------------------------------------------------------------------
#pragma mark - Dealloc
// ------------------------------------------------------------------------------------------
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObject:self];
}


@end
