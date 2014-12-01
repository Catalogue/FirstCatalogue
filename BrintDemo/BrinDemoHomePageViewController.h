//
//  BrinDemoHomePageViewController.h
//  BrintDemo
//
//  Created by Pradeep on 17/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "FXImageView.h"

@interface BrinDemoHomePageViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>
@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet UIView *homeDetailView;
@property (weak, nonatomic) IBOutlet UIView *offersView;
@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property (weak, nonatomic) IBOutlet UIImageView *offersImageView;
- (IBAction)calculateBtnClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *goldPriceTxtField;
@property (weak, nonatomic) IBOutlet UITextField *goldWightInGrams;
@property (weak, nonatomic) IBOutlet UITextField *wastageChargeTxtField;
@property (weak, nonatomic) IBOutlet UITextField *makingChargesTxtField;
@property (weak, nonatomic) IBOutlet UITextField *vatTxtField;
@property (weak, nonatomic) IBOutlet UIView *costBgView;

@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (strong, nonatomic) NSMutableArray *offersImagesArray;

@end
