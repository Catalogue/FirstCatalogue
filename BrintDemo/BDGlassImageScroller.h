//
//  BDGlassImageScroller.h
//  BrintDemo
//
//  Created by Tabrez on 17/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDGlassImageScroller : UIViewController < UIScrollViewDelegate >

@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@property (strong, nonatomic) NSMutableArray *imagesArray;

@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@end
