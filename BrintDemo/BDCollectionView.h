//
//  BDCollectionView.h
//  BrintDemo
//
//  Created by Tabrez on 27/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDCollectionInfo;

@interface BDCollectionView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


- (void)updateDetails:(BDCollectionInfo *)details;

@end
