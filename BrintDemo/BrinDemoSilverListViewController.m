//
//  BrinDemoSilverListViewController.m
//  BrintDemo
//
//  Created by Pradeep on 27/06/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoSilverListViewController.h"

@interface BrinDemoSilverListViewController ()

@property (nonatomic, retain) NSMutableArray *diamondItemsListArray;

@property (nonatomic, retain) NSMutableArray *diamondWomenItemsListArray;
@property (nonatomic, retain) NSMutableArray *diamondMenItemsListArray;
@property (nonatomic, retain) NSMutableArray *diamondKidsItemsListArray;
@property (nonatomic, retain) NSMutableArray *diamondOccasionItemsListArray;

@end

@implementation BrinDemoSilverListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.diamondMenItemsListArray = [[NSMutableArray alloc] initWithObjects:@"Ring",@"Chain",@"Pendant",@"Bracelite", nil];
    
    self.diamondWomenItemsListArray = [[NSMutableArray alloc] initWithObjects:@"Mangalsuthra",@"Necklace",@"Bangles",@"Earring",@"Ring",@"Chain",@"Pendant",@"Bracelite",@"Maang Tikka", nil];
    
    self.diamondKidsItemsListArray = [[NSMutableArray alloc] initWithObjects:@"Bangles",@"Earring",@"Ring",@"Chain",@"Pendant",@"Bracelite", @"Waist Chain", nil];
    
    self.diamondOccasionItemsListArray = [[NSMutableArray alloc] initWithObjects:@"Daily Wear",@"Office Wear",@"Casual Wear",@"Party Wear", nil];
    
    self.diamondItemsListArray = [[NSMutableArray alloc] init];
    
    switch (self.selectedIndex) {
        case 0:
            self.diamondItemsListArray = self.diamondWomenItemsListArray;
            break;
        case 1:
            self.diamondItemsListArray = self.diamondMenItemsListArray;
            break;
        case 2:
            self.diamondItemsListArray = self.diamondKidsItemsListArray;
            break;
        case 3:
            self.diamondItemsListArray = self.diamondOccasionItemsListArray;
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.diamondItemsListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BrinDemoMasterCell";
    BrinDemoMasterCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BrinDemoMasterCell" owner:self options:nil][0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //For transparent background view//
    //    cell.contentView.backgroundColor = [cell.contentView.backgroundColor colorWithAlphaComponent:0.6f];
    cell.contentView.backgroundColor = [UIColor colorWithRed:251.0f/255.0f green:221.0f/255.0f blue:157.0f/255.0f alpha:0.5f];
    cell.bgImageView.layer.backgroundColor = (RGBACOLOR(249.0f, 206, 19, 1.0f).CGColor);
    cell.bgImageView.layer.cornerRadius = 3.0f;
    cell.goldItemLable.text = [self.diamondItemsListArray objectAtIndex:indexPath.row];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
