//
//  GlassScrollerInfoView.m
//  BrintDemo
//
//  Created by Tabrez on 15/09/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "GlassScrollerInfoView.h"

@implementation GlassScrollerInfoView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    // Custom initialization..

    [self initializeView];
  }

  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  [self initializeView];
}

- (void)initializeView {
  self.backgroundColor = [UIColor colorWithRed:249.0 / 255.0 green:206.0 / 255.0 blue:19.0 / 255.0 alpha:0.8f];

  [self.titleLabel setFont:[UIFont fontWithName:HELVETICA_LIGHT_FONT size:50]];
  [self.titleLabel setShadowColor:[UIColor blackColor]];
  [self.titleLabel setShadowOffset:CGSizeMake(1, 1)];

  self.detailTextView.layer.cornerRadius = 3;
  self.detailTextView.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];

  self.buyDetailsView.layer.cornerRadius = 3;
  self.buyDetailsView.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];

  //#define AUTUMN1 [UIColor colorWithRed:249.0/255.0 green:206.0/255.0 blue:19.0/255.0 alpha:1.0f]
  //#define AUTUMN2 [UIColor colorWithRed:249.0/255.0 green:127.0/255.0 blue:19.0/255.0 alpha:1.0f]
}

- (IBAction)buyButtonClicked:(id)sender {
}

@end
