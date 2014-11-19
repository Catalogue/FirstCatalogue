//
//  WebService.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "WebService.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AFNetWorkAPIClient.h"
#import "AFImageRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@implementation WebService

static WebService *webInstance;

+ (WebService*)sharedInstance
{
    @synchronized(self) {
        if(webInstance == nil) {
            webInstance	= [[super allocWithZone:NULL] init];
        }
    }
    return webInstance;
}


+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}


- (id)copyWithZone:(NSZone*)zone
{
    return self;
}


#pragma mark -
#pragma mark - post request

- (void)postRequest:(APIBase *)apiBase andCallback:(ApiCallBack)callback
{
    __block NSString *apiPath = [apiBase apiName];
    __block NSMutableDictionary *parameters = [apiBase createJsonObjectForRequest];
    
    [[AFNetWorkAPIClient sharedClient] postPath:apiPath parameters:parameters  success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        DBLog(@"JSON = %@",JSON);
        [apiBase parseJsonObjectFromResponse:JSON];
        
        if (callback) {
            callback(apiBase, JSON, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        DBLog(@"error = %@",error);
        if (callback) {
            callback(apiBase, nil, error);
        }
    }];
}

#pragma mark -
#pragma mark - get request

- (void)getRequest:(APIBase *)apiBase andCallback:(ApiCallBack)callback
{
    __block NSString *apiPath = [apiBase apiName];
    __block NSMutableDictionary *parameters = [apiBase createJsonObjectForRequest];
    
    [[AFNetWorkAPIClient sharedClient] getPath:apiPath parameters:parameters  success:^(AFHTTPRequestOperation *operation, id JSON) {
        DBLog(@"JSON = %@",JSON);

        [apiBase parseJsonObjectFromResponse:JSON];
        
        callback(apiBase, JSON, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (callback) {
            callback(apiBase, nil, error);
        }
    }];
}

#pragma mark -
#pragma mark - cancel request

- (void)cancelHTTPOperationsWithMethod:(NSString *)method path:(NSString *)path
{
    [[AFNetWorkAPIClient sharedClient] cancelAllHTTPOperationsWithMethod:method path:path];
}


@end
