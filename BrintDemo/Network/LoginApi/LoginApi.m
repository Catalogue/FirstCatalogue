//
//  LoginApi.m
//  BrintDemo
//
//  Created by Pradeep on 17/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "LoginApi.h"

@implementation LoginApi

@synthesize loginDetails;

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
    return [NSString stringWithFormat:@"%@%@",[super apiName],kLoginApiUrl];
}


- (NSMutableDictionary *)createJsonObjectForRequest
{
    [super createJsonObjectForRequest];
    
    // Create request json object here..
    NSMutableDictionary *jsonObject = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.loginDetails.username,@"username",self.loginDetails.password,@"password",self.loginDetails.email,@"email",self.loginDetails.mnumber,@"mnumber", nil];

    
    return jsonObject;
}


- (void)checkForNilValues
{
    [super checkForNilValues];
}


- (id)parseJsonObjectFromResponse:(id)response
{
    [super parseJsonObjectFromResponse:response];
    
    if (response == [NSNull null]) {
        return nil;
    }
    
    if (API_SUCESS != [self.statusCode integerValue]) {
        return nil;
    }
    
//    NSDictionary *responseDict = [ParserUtility JSONObjectValue:response forKey:kResult];
//    NSString *value = [ParserUtility JSONObjectValue:responseDict forKey:kStatusCode];
//    self.statusCode = [NSNumber numberWithInteger:[value integerValue]];
//    self.errormessage = [ParserUtility JSONObjectValue:responseDict forKey:kErrorMessage];
//    value = [ParserUtility JSONObjectValue:responseDict forKey:kErrorCode];
//    self.errorCode = [NSNumber numberWithInteger:[value integerValue]];
    
//    NSLog(@"Login Response = %@", responseDict);
    return nil;
}


- (LoginDetails *)parsedOffersDetails:(NSDictionary *)offersDict
{
    LoginDetails *details = [[LoginDetails alloc] init];
    return details;
}


@end
