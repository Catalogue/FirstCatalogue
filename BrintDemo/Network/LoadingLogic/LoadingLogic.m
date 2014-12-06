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
#import "HomeScreenApi.h"


@implementation LoadingLogic


static LoadingLogic *loadingLogicSingleton = nil;
static NSString * const kGold = @"Gold";
static NSString * const kDiamond = @"Diamond";
static NSString * const kSilver = @"Silver";
static NSString * const kPlatinum = @"Platinum";


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
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callHomeScreenApi];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callOffersApi];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callCollectionApiForType:kGold];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callCollectionApiForType:kDiamond];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callCollectionApiForType:kPlatinum];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [self callCollectionApiForType:kSilver];
    });
}

- (void)callOffersApi
{
    OffersApi *apiObject = [[OffersApi alloc] init];
    apiObject.apiType = Get;
    apiObject.cacheing = CACHE_PERSISTANT;
    [self makeApiCallForObject:apiObject];
}

- (void)callCollectionApiForType:(NSString *)apiType
{
    CollectionsApi *apiObject = [[CollectionsApi alloc] init];
    apiObject.apiType = Get;
    apiObject.cacheing = CACHE_MEMORY;
    apiObject.collectionApiName = apiType;
    
    [self makeApiCallForObject:apiObject];
}

- (void)callHomeScreenApi
{
    HomeScreenApi *apiObject = [[HomeScreenApi alloc] init];
    apiObject.apiType = Get;
    apiObject.cacheing = CACHE_PERSISTANT;
    
    [self makeApiCallForObject:apiObject];
}

- (void)makeApiCallForObject:(APIBase *)apiObject
{
    [[DataUtility sharedInstance] apiDataForObject:apiObject response:^(APIBase *response, DataType dataType) {
        ;
    }];
}


@end
