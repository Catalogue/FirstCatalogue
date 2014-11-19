//
//  BDCollectionItemInfo.m
//  BrintDemo
//
//  Created by Tabrez on 20/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDCollectionItemInfo.h"

@implementation BDCollectionItemInfo


@synthesize imageUrl;
@synthesize itemName;
@synthesize itemCost;
@synthesize itemMetalName;
@synthesize isAddedToCart;
@synthesize itemDescription;
@synthesize cachedImage;


- (id)init
{
    self = [super init];
    
    if (self) {
        // Do initialization..
    }
    
    return self;
}



@end
