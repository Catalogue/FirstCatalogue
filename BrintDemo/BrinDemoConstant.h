//
//  BrinDemoConstant.h
//  BrintDemo
//
//  Created by Pradeep on 27/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BrinDemoConstant <NSObject>


/*   RGB Macros   */

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define HELVETICA_LIGHT_FONT @"HelveticaNeue-UltraLight"

#define CACHE_REFRESH_INTERVAL 300


/*   Request methos enums   */

typedef NS_ENUM( NSUInteger, HTTPMethodType) {
    Get,
    Post,
    Put,
    Delete
};

/*   Custom Alert type enums   */

typedef NS_ENUM(NSInteger, DataType) {
    DataTypeOthers = -1,
    DataTypeNoData = 0, // No data available in DB
    DataTypeOldData, // Old data present in db, this means that, data time stamp has expired.
    DataTypeUsableData, // data present in db with in refresh time stamp specified.
    DataTypeApiData // Making Api call to server to get data.
};

typedef void (^responseCallBack)(id response, DataType dataType);

typedef enum {
    CACHE_DISABLED, // cacheing is disabled
    CACHE_MEMORY,  // cache the objects in memory not in datamodel
    CACHE_PERSISTANT, // cache in datamodel :if datamodel is absent then cache in memory
    REFRESH_MEMORY_CACHE, // fetch new data and cache in memory
    REFRESH_PERSISTANT_CACHE  // fetch new data and cache in datamodel :if datamodel is absent then cache in memory
} CachePolicy;

@end
