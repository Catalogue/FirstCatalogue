//
//  BDCollectionItemInfo.h
//  BrintDemo
//
//  Created by Tabrez on 20/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDCollectionItemInfo : NSObject

@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *itemName;
@property (nonatomic) CGFloat itemCost;
@property (strong, nonatomic) NSString *itemMetalName;
@property (strong, nonatomic) NSNumber *isAddedToCart;
@property (strong, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) UIImage *cachedImage;


@end
