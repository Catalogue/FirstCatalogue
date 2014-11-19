//
//  HomeScreenApi.h
//  BrintDemo
//
//  Created by Pradeep on 27/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "APIBase.h"
#import "HomeScreenApiKeys.h"
#import "HomeScreenDetails.h"

@interface HomeScreenApi : APIBase

@property (strong, nonatomic) NSMutableArray *homeScreenArray;

@end
