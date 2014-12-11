//
//  BDCollectionDetailVC.m
//  BrintDemo
//
//  Created by Tabrez on 20/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDCollectionDetailVC.h"
#import "BDCollectionItemInfo.h"

@interface BDCollectionDetailVC ()

@end

@implementation BDCollectionDetailVC

@synthesize itemDetails;
@synthesize itemsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.itemsArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeView];
}


- (void)initializeView
{
    self.title = itemDetails.itemName;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(4, 4, 4, 4);
    
    [self.addToCartButton setBackgroundImage:[[UIImage imageNamed:@"orange_scalable.png"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal];
    
    self.itemDescriptionBgView.backgroundColor = CLEAR_COLOR;
    self.itemDescriptionTextView.backgroundColor = BLACK_HALF_TRANSPARENT;
    self.itemDescriptionTextView.layer.cornerRadius = 4.0f;
    
    self.itemDetailBgView.layer.cornerRadius = 10.0f;
    self.itemDetailBgView.layer.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.75f].CGColor;
//    #define BLACK_HALF_TRANSPARENT [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]
    
//    self.itemCostLabel.text = [NSString stringWithFloatValue:itemDetails.itemCost];
//    self.itemNameLabel.text = itemDetails.itemName;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addToCartButtonClicked:(id)sender
{
    NSInteger tag = self.addToCartButton.tag;
    UIEdgeInsets insets = UIEdgeInsetsMake(4, 4, 4, 4);
    
    if (tag) {
        self.itemDetails.isAddedToCart = [NSNumber numberWithBool:NO];
        self.addToCartButton.tag = 0;
        
        [self.addToCartButton setTitle:@"Remove from cart" forState:UIControlStateNormal];
        [self.addToCartButton setBackgroundImage:[[UIImage imageNamed:@"blue_scalable.png"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal];
    }
    else {
        self.itemDetails.isAddedToCart = [NSNumber numberWithBool:YES];
        self.addToCartButton.tag = 1;
        
        [self.addToCartButton setTitle:@"Add to cart" forState:UIControlStateNormal];
        [self.addToCartButton setBackgroundImage:[[UIImage imageNamed:@"orange_scalable.png"] resizableImageWithCapInsets:insets] forState:UIControlStateNormal];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.itemImageView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.itemImageView.hidden = NO;
}

@end
