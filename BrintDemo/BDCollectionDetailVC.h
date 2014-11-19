//
//  BDCollectionDetailVC.h
//  BrintDemo
//
//  Created by Tabrez on 20/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDCollectionItemInfo;


@interface BDCollectionDetailVC : UIViewController


@property (strong, nonatomic) BDCollectionItemInfo *itemDetails;

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIView *itemDetailBgView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCostLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@property (weak, nonatomic) IBOutlet UIView *itemDescriptionBgView;
@property (weak, nonatomic) IBOutlet UITextView *itemDescriptionTextView;



- (IBAction)addToCartButtonClicked:(id)sender;

@end
