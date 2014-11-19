//
//  BIHomeViewController.h
//  BrintDemo
//
//  Created by Tabrez on 10/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"


@interface BIHomeViewController : UIViewController < iCarouselDataSource, iCarouselDelegate >

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *homeInfoView;
@property (weak, nonatomic) IBOutlet UIView *offersInfoView;
@property (weak, nonatomic) IBOutlet UIView *collectionsInfoView;

@property (weak, nonatomic) IBOutlet UIScrollView *imagesScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *informationScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *offersScrollView;

@property (weak, nonatomic) IBOutlet UIButton *rightArrow;
@property (weak, nonatomic) IBOutlet UILabel *homeTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *homeDescriptionLable;

- (IBAction)leftArrowBtnCliked:(id)sender;
- (IBAction)rightArrowButtonClicked:(id)sender;


@end
