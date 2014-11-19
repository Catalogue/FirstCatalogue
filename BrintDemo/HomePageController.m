//
//  HomePageController.m
//  BrintDemo
//
//  Created by Tabrez on 24/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "HomePageController.h"


@interface HomePageController ()

@end


@implementation HomePageController


@synthesize pageControl;
@synthesize homeScrollView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeScrollViewAndPageControl];
}


- (void)initializeScrollViewAndPageControl
{
    self.homeScrollView.delegate = self;
    
    int count = 0;
    
    CGFloat xPadding = 0;
    CGFloat yPadding = 0;
    CGFloat xOrigin = xPadding;
    CGFloat yOrigin = yPadding;
    CGFloat width = self.homeScrollView.frame.size.width - (2 * xOrigin);
    CGFloat height = self.homeScrollView.frame.size.height - (2 * yOrigin);
    
    CGRect frame = CGRectMake(xOrigin, yOrigin, width, height);
    
    for (count = 0; count < 10; count ++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        frame = CGRectMake(xOrigin * count, yOrigin, width, height);
        
        imageView.frame = frame;
        
        if (count % 2) {
            imageView.backgroundColor = [UIColor greenColor];
        }
        else {
            imageView.backgroundColor = [UIColor orangeColor];
        }
        
        [self.homeScrollView addSubview:imageView];
        
    }
    
    CGSize size = CGSizeMake((count + 1) * width, height);
    
    [self.homeScrollView setContentSize:size];
    [self.homeScrollView setContentOffset:CGPointZero];
    
    pageControl.numberOfPages = count + 1;
}


- (void)updatePageControl:(NSInteger)page
{
    self.pageControl.currentPage = page;
}



#pragma mark -
#pragma mark - scroll view delegate.

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    ;
}


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = self.homeScrollView.frame.size.width;
    int page = floor((self.homeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    [self updatePageControl:page];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
    ;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
