//
//  BDScrollerCell.m
//  BrintDemo
//
//  Created by Tabrez on 03/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDScrollerCell.h"

@implementation BDScrollerCell

@synthesize imageView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initialize];
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initialize];
}


- (void)initialize
{
    ;
}


@end
