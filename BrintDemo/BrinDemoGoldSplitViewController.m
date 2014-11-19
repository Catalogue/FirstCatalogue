//
//  BrinDemoGoldSplitViewController.m
//  BrintDemo
//
//  Created by Pradeep on 05/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoGoldSplitViewController.h"
#import "BDImageScrollerVC.h"

@interface BrinDemoGoldSplitViewController ()


@end


@implementation BrinDemoGoldSplitViewController

@synthesize shouldHideMaster;


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
    self.navigationController.navigationBarHidden = YES;
    
    self.delegate = self;
    
    self.shouldHideMaster = YES;
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:
(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
    
    UINavigationController *navigationVC = (UINavigationController *)vc;
    NSArray *vcArray = navigationVC.viewControllers;
    
    UIViewController *topVC = [vcArray lastObject];
    
    if ([topVC isKindOfClass:[BDImageScrollerVC class]]) {
        return YES;
    }
    else {
        return NO;
    }
    
    return self.shouldHideMaster;
}


- (void)hideMasterDetailVC:(BOOL)isHidden
{
    self.shouldHideMaster = isHidden;
    
    if (shouldHideMaster) {
        //[self splitViewController:self shouldHideViewController:self inOrientation:UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight];
    }
    else {
        //
    }
}


@end
