//
//  BrinDemoSilverDetailViewController.m
//  BrintDemo
//
//  Created by Pradeep on 05/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoSilverDetailViewController.h"


@interface BrinDemoSilverDetailViewController ()

@end

@implementation BrinDemoSilverDetailViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
    [self pushCollectionView];
}


- (void)pushCollectionView
{
    BrinDemoCollectionViewController *collectionVC = [[BrinDemoCollectionViewController alloc] init];
    [self.navigationController pushViewController:collectionVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
