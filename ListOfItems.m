//
//  ListOfItems.m
//  BrintDemo
//
//  Created by Pradeep on 01/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "ListOfItems.h"
#import "Products.h"

@implementation ListOfItems

@synthesize CT;

@synthesize products;

+ (Class)products_class
{
    return [Products class];
}

@end
