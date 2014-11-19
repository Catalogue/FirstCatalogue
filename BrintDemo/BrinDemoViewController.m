//
//  BrinDemoViewController.m
//  BrintDemo
//
//  Created by Pradeep on 22/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoViewController.h"

@interface BrinDemoViewController ()

@end

@implementation BrinDemoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
