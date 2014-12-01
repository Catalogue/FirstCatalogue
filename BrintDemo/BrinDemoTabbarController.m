//
//  BrinDemoTabbarController.m
//  BrintDemo
//
//  Created by Tabrez on 13/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoTabbarController.h"
#import "BrinDemoDiamondSplitViewController.h"
#import "BrinDemoGoldSplitViewController.h"
#import "BrinDemoSettingsViewController.h"
#import "BrinDemoPlatinumSplitViewController.h"
#import "BrinDemoSilverSplitViewController.h"
#import "BIHomeViewController.h"


@interface BrinDemoTabbarController ()

@end


@implementation BrinDemoTabbarController


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
    
    BIHomeViewController *homeVC = (BIHomeViewController *)[[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    
    BrinDemoGoldSplitViewController *goldSplitVC = (BrinDemoGoldSplitViewController *)[[UIStoryboard storyboardWithName:@"Gold" bundle:nil] instantiateInitialViewController];
    
    BrinDemoDiamondSplitViewController *diamondSplitVC = (BrinDemoDiamondSplitViewController *)[[UIStoryboard storyboardWithName:@"Diamond" bundle:nil] instantiateInitialViewController];
    
    BrinDemoPlatinumSplitViewController *platinumSplitVC = (BrinDemoPlatinumSplitViewController *)[[UIStoryboard storyboardWithName:@"Platinum" bundle:nil] instantiateInitialViewController];
    
    BrinDemoSilverSplitViewController *silverSplitVC = (BrinDemoSilverSplitViewController *)[[UIStoryboard storyboardWithName:@"Silver" bundle:nil] instantiateInitialViewController];
    
    BrinDemoSettingsViewController *settingsVC = (BrinDemoSettingsViewController *)[[UIStoryboard storyboardWithName:@"Settings" bundle:nil] instantiateInitialViewController];

    
    UITabBarItem *tab1 = [[UITabBarItem alloc] initWithTitle:@"Home"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:1];
    [homeVC setTabBarItem:tab1];
    
    
    UITabBarItem *tab2 = [[UITabBarItem alloc] initWithTitle:@"Gold"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:2];
    [goldSplitVC setTabBarItem:tab2];
    
    UITabBarItem *tab3 = [[UITabBarItem alloc] initWithTitle:@"Diamond"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:3];
    [diamondSplitVC setTabBarItem:tab3];
    
    UITabBarItem *tab4 = [[UITabBarItem alloc] initWithTitle:@"Platinum"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:4];
    [platinumSplitVC setTabBarItem:tab4];
    
    UITabBarItem *tab5 = [[UITabBarItem alloc] initWithTitle:@"Silver"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:5];
    [silverSplitVC setTabBarItem:tab5];

    UITabBarItem *tab6 = [[UITabBarItem alloc] initWithTitle:@"Settings"
                                                       image:[[UIImage imageNamed:@"goldTab.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] tag:6];
    [settingsVC setTabBarItem:tab6];
    
    self.viewControllers = [NSArray arrayWithObjects:homeVC,
                                    goldSplitVC,
                                    diamondSplitVC,
                                    platinumSplitVC,
                                    silverSplitVC,
                                    settingsVC,
                                    nil];
    
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarStyle:UIBarStyleBlack];

    // doing this results in an easier to read unselected state then the default iOS 7 one
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Thonburi-Bold" size:16.0f],
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
