//
//  CollectionsApi.h
//  BrintDemo
//
//  Created by Pradeep on 28/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "APIBase.h"
#import "CollectionsApiKeys.h"
//#import "CollectionDetails.h"

@interface CollectionsApi : APIBase

@property (nonatomic, strong) NSArray *listOfItems;

//@property (strong, nonatomic) NSMutableArray *productsArray;
//
//@property (strong, nonatomic) NSMutableArray *itemsArray;
//
@property (strong, nonatomic) NSMutableString *collectionApiName;
//
//@property (strong, nonatomic) CollectionDetails *collectionDetails;

@end
