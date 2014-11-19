//
//  BDImageScrollerVC.h
//  BrintDemo
//
//  Created by Tabrez on 03/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDImageScrollerVC : UIViewController < UICollectionViewDataSource, UICollectionViewDelegate >

@property (strong, nonatomic) NSMutableArray *dataSourceArray;

@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;

@end
