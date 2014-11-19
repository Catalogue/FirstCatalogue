//
//  APIBase.m
//  CabHoundPassenger
//
//  Created by Tabrez on 4/18/13.
//  Copyright (c) 2013 Tarento technologies. All rights reserved.
//

#import "APIBase.h"
#import "HelperMethods.h"

@implementation APIBase

@synthesize statusCode;
@synthesize message;
@synthesize errormessage;
@synthesize sessionId;
@synthesize errorCode;


- (id)init
{
    self = [super init];
    
    if (self) {
        self.statusCode = [NSNumber numberWithInt:-1];
        self.errorCode = nil;
        self.message = nil;
        self.errormessage = nil;
        self.sessionId = nil;
    }
    
    return self;
}


#pragma -
#pragma - mark super class method.


- (NSString *)apiName
{
    return KBaseURL;
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    return nil;
}


- (id)parseJsonObjectFromResponse:(id)response
{
    if ([response respondsToSelector:@selector(objectForKey:)]) {
        
        NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
        
        self.statusCode = [ParserUtility JSONObjectValue:responseDict forKey:kStatusCode];
        self.errormessage = [ParserUtility JSONObjectValue:responseDict forKey:kStatusMessage];
        self.errorCode = [ParserUtility JSONObjectValue:responseDict forKey:kErrorCode];
    }
    
    return nil;
}


- (void)displayError
{
    NSString *errorMessage = self.errormessage;
    if (nil == errorMessage) {
        errorMessage = NSLocalizedString(@"serverError", @"some error in server.");
    }
    [[HelperMethods sharedInstance] showAlertWithTitle:@"" message:errorMessage];
}


- (void)checkForNilValues
{
    self.sessionId = [ParserUtility checkForNilObjectAssignEmptyValue:self.sessionId];
}


@end