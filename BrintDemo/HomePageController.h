//
//  HomePageController.h
//  BrintDemo
//
//  Created by Tabrez on 24/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageController : UIViewController < UIScrollViewDelegate >

@property (weak, nonatomic) IBOutlet UIScrollView *homeScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
