//
//  BDImageScrollerPanel.h
//  BrintDemo
//
//  Created by Tabrez on 14/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "UATitledModalPanel.h"

@interface BDImageScrollerPanel : UATitledModalPanel

@property (strong, nonatomic) NSMutableArray *dataSourceArray;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
