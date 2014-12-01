//
//  CollectionsApi.m
//  BrintDemo
//
//  Created by Pradeep on 28/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "CollectionsApi.h"

@implementation CollectionsApi

@synthesize listOfItems, productsArray, itemsArray, collectionApiName, collectionDetails;

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


#pragma mark -
#pragma mark - super class method.


- (NSString *)apiName
{
    return [NSString stringWithFormat:@"%@%@%@",[super apiName],kApiPrefix,collectionApiName];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = nil;
    
    return jsonObject;
}


- (void)checkForNilValues
{
    [super checkForNilValues];
}


- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    collectionDetails = [[CollectionDetails alloc] init];
    
    if (response == [NSNull null]) {
        return nil;
    }
    
    if (API_SUCESS != self.statusCode) {
        return nil;
    }
    
    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
    
    if ([responseDict respondsToSelector:@selector(objectForKey:)]) {
        NSMutableArray *array = [ParserUtility JSONObjectValue:responseDict forKey:kCollection_ListOfItems];
        
        if (nil != array && [array count]) {
            self.listOfItems = [[NSMutableArray alloc] init];
            for ( NSDictionary *homescreenDict in array) {
                collectionDetails = [self parsedCollectionsDetails:homescreenDict];
                [self.listOfItems addObject:collectionDetails];
            }
        }
    }
    
    return nil;
}

- (CollectionDetails *)parsedCollectionsDetails:(NSDictionary *)collectionsDict
{
    CollectionDetails *details = [[CollectionDetails alloc] init];
    details.CT = [ParserUtility JSONObjectValue:collectionsDict forKey:kCategory_Type];
    details.products = [ParserUtility JSONObjectValue:collectionsDict forKey:kProducts];
    return details;
}

@end
