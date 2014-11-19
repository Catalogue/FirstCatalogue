//
//  BDCollectionView.m
//  BrintDemo
//
//  Created by Tabrez on 27/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDCollectionView.h"
#import "BDCollectionInfo.h"

@implementation BDCollectionView

@synthesize imageView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)updateDetails:(BDCollectionInfo *)details
{
    
}


@end
