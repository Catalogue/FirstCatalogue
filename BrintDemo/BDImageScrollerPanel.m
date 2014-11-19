//
//  BDImageScrollerPanel.m
//  BrintDemo
//
//  Created by Tabrez on 14/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDImageScrollerPanel.h"

@interface BDImageScrollerPanel ()

@property (strong, nonatomic) UIScrollView *imageScrollView;
@property (strong, nonatomic) NSMutableArray *imagesArray;

@end

@implementation BDImageScrollerPanel

@synthesize dataSourceArray;

@synthesize imageScrollView;
@synthesize imagesArray;


- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize:frame];
        
    }
    return self;
}


- (void)initialize:(CGRect)frame
{
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    [self.contentView addSubview:imageScrollView];
    
    self.imagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"],[UIImage imageNamed:@"j6.png"],[UIImage imageNamed:@"j7.png"],[UIImage imageNamed:@"j8.png"],[UIImage imageNamed:@"j9.png"], [UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"], nil];
    
    [self reloadImageScrollView];
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initialize:[UIScreen mainScreen].bounds];
}


- (void)reloadImageScrollView
{
    [self cleanScrollView];
    
    CGRect frame = self.imageScrollView.bounds;
    CGFloat xOrigin = 0;
    
    for (int i = 0; i < imagesArray.count; i++) {
        frame.origin.x = xOrigin;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [imagesArray objectAtIndex:i];
        imageView.backgroundColor = [UIColor greenColor];
        [self.imageScrollView addSubview:imageView];
        
        xOrigin += frame.size.width;
    }
    
    [self.imageScrollView setContentOffset:CGPointMake(xOrigin, frame.size.height)];
}


- (void)cleanScrollView
{
    NSArray *subViews = [self.imageScrollView subviews];
    for (id view in subViews) {
        if ([view respondsToSelector:@selector(removeFromSuperview)]) {
            [view removeFromSuperview];
        }
    }
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self.imageScrollView setFrame:self.contentView.bounds];
}




@end
