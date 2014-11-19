//
//  NSString+LocalizedString.h
//  DeviceManagement
//
//  Created by Tabrez on 18/07/14.
//  Copyright (c) 2014 Tabrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LocalizedString)

+ (NSString *)localizedValueForKey:(NSString *)key;

+ (NSString *)stringWithFloatValue:(CGFloat)value;

+ (NSString *)itemDetailString;


@end
