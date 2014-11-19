//
//  BDCollectionInfo.h
//  BrintDemo
//
//  Created by Tabrez on 27/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDCollectionInfo : NSObject

@property (strong, nonatomic) NSString *imageUrl; // For dynamic support..
@property (strong, nonatomic) NSString *imageName; // If we use images in app bundle..
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;

@end
