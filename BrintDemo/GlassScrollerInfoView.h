//
//  GlassScrollerInfoView.h
//  BrintDemo
//
//  Created by Tabrez on 15/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlassScrollerInfoView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@property (weak, nonatomic) IBOutlet UIView *buyDetailsView;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

- (IBAction)buyButtonClicked:(id)sender;

@end
