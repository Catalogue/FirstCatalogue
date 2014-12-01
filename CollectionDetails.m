//
//  CollectionDetails.m
//  BrintDemo
//
//  Created by Pradeep on 28/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "CollectionDetails.h"
#import "Products.h"

@implementation CollectionDetails

@synthesize listOfItems;

@synthesize CT;

@synthesize products;

+ (Class)products_class
{
    return [Products class];
}


@end
