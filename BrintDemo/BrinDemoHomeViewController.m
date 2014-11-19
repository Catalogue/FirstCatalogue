//
//  BrinDemoHomeViewController.m
//  BrintDemo
//
//  Created by Pradeep on 05/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoHomeViewController.h"
#import "BIHomeViewController.h"
#import "BrinDemoHomePageViewController.h"

@interface BrinDemoHomeViewController ()

@end

@implementation BrinDemoHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"RingBg.png"]];
    
    UIButton *home = [UIButton buttonWithType:UIButtonTypeSystem];
    [home addTarget:self action:@selector(showNewHome) forControlEvents:UIControlEventTouchUpInside];
    [home setTitle:@"HOME" forState:UIControlStateNormal];
    home.frame = CGRectMake(10, 100, 100, 100);
    
//    UIBarButtonItem *lp_rightBtn = [[UIBarButtonItem alloc] initWithCustomView:home];
//    self.navigationItem.rightBarButtonItem = lp_rightBtn;

    [self.view addSubview:home];
}


- (void)showNewHome
{
//    BIHomeViewController *homeVC = (BIHomeViewController *)[[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    BrinDemoHomePageViewController *homeVC = (BrinDemoHomePageViewController *)[[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    [self.navigationController pushViewController:homeVC animated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
