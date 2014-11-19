//
//  APIBase.h
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIDefines.h"
#import "ParserUtility.h"

@interface APIBase : NSObject

@property (nonatomic, strong) NSNumber *statusCode;
@property (nonatomic, strong) NSNumber *errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *errormessage;
@property (nonatomic, strong) NSString *sessionId;

- (NSString *)apiName;

- (NSMutableDictionary *)createJsonObjectForRequest;

- (id)parseJsonObjectFromResponse:(id)lp_response;

- (void)displayError;

- (void)checkForNilValues;

@end
