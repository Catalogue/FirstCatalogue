//
//  LoadingLogic.m
//  BrintDemo
//
//  Created by Tabrez on 04/12/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "LoadingLogic.h"
#import "OffersApi.h"
#import "CollectionsApi.h"


@implementation LoadingLogic


static LoadingLogic *loadingLogicSingleton = nil;


+ (id)sharedLoadingLogic
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        loadingLogicSingleton = [[self alloc] init];
    });
    return loadingLogicSingleton;
}


- (void)startBackGroundLoading
{
    [self callOffersApi];
    
    [self callCollectionApiForType:@"Gold"];
}


- (void)callOffersApi
{
    OffersApi *apiObject = [[OffersApi alloc] init];
    apiObject.apiType = Get;
    apiObject.cacheing = CACHE_PERSISTANT;

    [[DataUtility sharedInstance] apiDataForObject:apiObject response:^(APIBase *response, DataType dataType) {
        ;
    }];
}


- (void)callCollectionApiForType:(NSString *)apiType
{
    CollectionsApi *apiObject = [[CollectionsApi alloc] init];
    apiObject.apiType = Get;
    apiObject.cacheing = CACHE_MEMORY;
    apiObject.collectionApiName = apiType;
    
    [[DataUtility sharedInstance] apiDataForObject:apiObject response:^(APIBase *response, DataType dataType) {
        ;
    }];
}


@end
