//
//  BrinDemoDiamondDetailViewController.m
//  BrintDemo
//
//  Created by Pradeep on 05/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoDiamondDetailViewController.h"

@interface BrinDemoDiamondDetailViewController ()

@end

@implementation BrinDemoDiamondDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
  [self pushCollectionView];
}

- (void)pushCollectionView {
  BrinDemoCollectionViewController *collectionVC = [[BrinDemoCollectionViewController alloc] init];
  collectionVC.collectionType = @"Diamond";

  NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.splitViewController.viewControllers];

  UINavigationController *navigationVC = self.navigationController;

  navigationVC.viewControllers = @[ collectionVC ];

  if (viewControllers.count > 1) {
    viewControllers[1] = navigationVC;
  }

  self.splitViewController.viewControllers = viewControllers;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
