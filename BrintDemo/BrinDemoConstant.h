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

@end
