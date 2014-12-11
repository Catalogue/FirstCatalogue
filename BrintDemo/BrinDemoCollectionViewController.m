//
//  BrinDemoCollectionViewController.m
//  BrintDemo
//
//  Created by Pradeep on 04/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoCollectionViewController.h"
#import "BDCollectionCell.h"
#import "BDCollectionFlowLayout.h"
#import "BDCollectionHeaderView.h"
#import "CSStickyHeaderFlowLayout.h"
#import "CSSearchBarHeader.h"
#import "SVSegmentedControl.h"
#import "BDCollectionItemInfo.h"
#import "BDCollectionDetailVC.h"
#import "BDImageScrollerVC.h"
#import "BDGlassImageScroller.h"
#import "CollectionsApi.h"
#import "ListOfItems.h"
#import "Products.h"
#import "Items.h"

@interface BrinDemoCollectionViewController ()

@end


NSString *const CSSearchBarHeaderIdentifier = @"CSSearchBarHeader";


@implementation BrinDemoCollectionViewController


@synthesize collectionView;
@synthesize searchView;
@synthesize itemSearchBar;
@synthesize rangeSlider;
@synthesize sliderRangeValue;
@synthesize searchFlags;
@synthesize searchListArray;
@synthesize selectedSearchOption;
@synthesize dataSourceArray;
@synthesize imagesArray;


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
    // Do any additional setup after loading the view from its nib.
    [self callGoldCollectionApi];
    [self initializeSearchView];
    [self initializeCollectionView];
    [self searchResults];
}

- (void)callGoldCollectionApi
{
    CollectionsApi *goldCollectionsApi = [[CollectionsApi alloc] init];
    goldCollectionsApi.apiType = Get;
    goldCollectionsApi.cacheing = CACHE_MEMORY;
    goldCollectionsApi.collectionApiName = [NSMutableString stringWithFormat:@"Gold"];

    [[DataUtility sharedInstance] dataForObject:goldCollectionsApi response:^(APIBase *response, DataType dataType) {
        if (goldCollectionsApi.errorCode == 0) {
            if (!self.imagesArray) {
                self.imagesArray = [[NSMutableArray alloc] init];
            }
            for (ListOfItems *listOfItems in goldCollectionsApi.listOfItems) {
                for (Products *products in listOfItems.products) {
                    for (Items *items in products.items) {
                        [self.imagesArray addObject:items.uri];
                    }
                }
            }
            [self reloadCollectionView];
        }
    }];
}


- (void)initializeSearchView
{
    itemSearchBar.placeholder = NSLocalizedString(@"Search", @"Search");
    itemSearchBar.backgroundColor = CLEAR_COLOR;
    [self.itemSearchBar setBackgroundImage:[[UIImage alloc] init]];
    
    self.searchView.layer.borderWidth = 1.0f;
    self.searchView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.rangeSlider.minimumValue = 1000;
    self.rangeSlider.maximumValue = 1000 * 500;
    self.sliderRangeValue = self.rangeSlider.minimumValue;
    
    [self updateSliderLabels];
    
    SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Price", @"Purity", @"Weight", nil]];
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    CGRect frame = CGRectMake((self.searchView.frame.size.width/2) - (self.searchView.frame.size.width/3), 110, 340, 30);
    
    yellowRC.frame = frame;
    
	yellowRC.crossFadeLabelsOnDrag = YES;
	yellowRC.font = [UIFont fontWithName:@"Menlo" size:16];
	yellowRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
	yellowRC.height = 45;
    [yellowRC setSelectedSegmentIndex:0 animated:NO];
	yellowRC.thumb.tintColor = [UIColor grayColor];
	yellowRC.thumb.textColor = [UIColor whiteColor];
	yellowRC.thumb.textShadowColor = [UIColor colorWithWhite:1 alpha:0.5];
	yellowRC.thumb.textShadowOffset = CGSizeMake(0, 1);
    
	[self.searchView addSubview:yellowRC];
}


- (void)updateSliderLabels
{
    self.minValueLabel.text = [NSString stringWithFormat:@"%.0f",self.sliderRangeValue];
    self.maxValueLabel.text = [NSString stringWithFormat:@"%.0f",self.rangeSlider.maximumValue];
}


- (void)segmentedControlChangedValue:(SVSegmentedControl *)segmentControl
{
    self.selectedSearchOption = segmentControl.selectedSegmentIndex;
    
    switch (selectedSearchOption) {
        case SearchItemByName: {
            
            break;
        }
            
        case SearchItemByValue: {
            
            break;
        }
            
        case SearchItemByMetal: {
            
            break;
        }
            
        default:
            break;
    }
    
    [self searchResults];
}



- (void)initializeCollectionView
{
    // Allocate and configure the layout.
    
    // Register reusable items
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionCell class]) bundle:nil]
     forCellWithReuseIdentifier:NSStringFromClass([BDCollectionCell class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDCollectionHeaderView class]) bundle:nil]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
            withReuseIdentifier:NSStringFromClass([BDCollectionHeaderView class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CSSearchBarHeader class]) bundle:nil]
          forSupplementaryViewOfKind:CSSearchBarHeaderIdentifier
                 withReuseIdentifier:NSStringFromClass([CSSearchBarHeader class])];
    
    self.collectionView.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg4.png"]];
}


- (void)reloadCollectionView
{
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointZero];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    BDCollectionHeaderView *view = nil;
//    CSSearchBarHeader *searchHeaderView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = (BDCollectionHeaderView *)[self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"BDCollectionHeaderView" forIndexPath:indexPath];
        
        view.backgroundColor =  RGBACOLOR(249.0f, 206, 19, 1.0f);
        view.layer.borderWidth = 1.0f;
        view.layer.borderColor = [UIColor darkGrayColor].CGColor;
        view.titleLabel.text = [NSString stringWithFormat:@"Section = %ld", (long)indexPath.section];
        view.titleLabel.font = [UIFont fontWithName:@"Menlo" size:16];

        return view;
    }
    
    
//    else if ([kind isEqualToString:CSSearchBarHeaderIdentifier]) {
//        searchHeaderView = (CSSearchBarHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CSSearchBarHeaderIdentifier forIndexPath:indexPath];
//        
//        return searchHeaderView;
//    }

    return nil;
}



#pragma mark -


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BDCollectionCell";
    
    BDCollectionCell *cell = (BDCollectionCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    // Store the image you get from url..
    
    cell.baseView.backgroundColor = WHITE_LIGHT;
    cell.backgroundColor = [UIColor clearColor];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.imagesArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
    cell.baseView.layer.cornerRadius = 1.0f;
    [[BDUtility sharedInstance] addShadowToView:cell.baseView];
    [[BDUtility sharedInstance] addShadowToView:cell.imageView];
    [[BDUtility sharedInstance] addShadowToView:cell];

    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imagesArray count];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.imagesArray count];
}


//-(UICollectionViewController *)nextViewControllerAtPoint:(CGPoint)p
//{
//    return nil;
//}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180 , 180);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BDCollectionItemInfo *itemInfo = nil;
    NSMutableArray *detailArray = [dataSourceArray objectAtIndex:indexPath.section];
    
    if (indexPath.row < detailArray.count) {
        itemInfo = [detailArray objectAtIndex:indexPath.row];
    }
    
//    BDCollectionDetailVC *detailVC = [[BDCollectionDetailVC alloc] init];
//    detailVC.itemDetails = itemInfo;
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    
//    BDImageScrollerVC *imageScroller = [[BDImageScrollerVC alloc] init];
//    imageScroller.dataSourceArray = self.dataSourceArray;
//    
//    [self.navigationController pushViewController:imageScroller animated:YES];
    
    BDGlassImageScroller *imageScroller = [[BDGlassImageScroller alloc] init];
    [self.navigationController pushViewController:imageScroller animated:YES];
}


//- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
//                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
//{
//    UICollectionViewTransitionLayout *transitionLayout = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
//    return transitionLayout;
//}



- (IBAction)rangeSliderValueChanged:(id)sender
{
    self.sliderRangeValue = self.rangeSlider.value;
    
    [self updateSliderLabels];
}


- (IBAction)rangeSliderValueEditingDidEnd:(id)sender
{
    [self searchResults];
    
}


#pragma mark -
#pragma mark - search delegates.


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	itemSearchBar.text = nil;
	[itemSearchBar resignFirstResponder];
	searchFlags.searching = NO;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
	[itemSearchBar resignFirstResponder];
	[self searchResults];
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar
{
	if(searchFlags.searching)
		return;
	
    searchFlags.searching = YES;
    
	if (searchFlags.doneClicked) {
		searchFlags.doneClicked = NO;
	}
	if (searchFlags.clearClicked) {
		[itemSearchBar resignFirstResponder];
		//[self doneSearching_Clicked];
		searchFlags.clearClicked = NO;
        searchFlags.doneClicked = YES;
        searchFlags.searching = NO;
        //[self fetchBookForBookCase];
	}
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText
{
    if([searchText length] > 0) {
        searchFlags.searching = YES;
        [self searchResults];
    }
    else {
//        //[self.mp_searchList removeAllObjects];
        searchFlags.clearClicked = YES;
        searchFlags.searching = NO;
        [itemSearchBar resignFirstResponder];
        if (searchFlags.doneClicked) {
            searchFlags.doneClicked = NO;
        }
        if (searchFlags.clearClicked) {
            [itemSearchBar resignFirstResponder];
            [self doneSearching_Clicked];
            //[self fetchBookForBookCase];
        }
    }
}

- (void)searchResults
{
    // search according to selected search option..
    
    // use combination of selectedSearchOption and search text passed and slider value..
    
//    NSString *searchText = itemSearchBar.text;
    
    NSMutableArray *resultArray = nil; // Get searched arrray from here.
    
    if ([resultArray count]) {
        self.searchListArray = resultArray;
    }
    else {
        [self.searchListArray removeAllObjects];
    }
    
    [self reloadCollectionView];
}

- (void)doneSearching_Clicked
{
	searchFlags.doneClicked = YES;
	itemSearchBar.text = @"";
	[itemSearchBar resignFirstResponder];
	searchFlags.searching = NO;
    
    [self reloadCollectionView];
}

- (void)abortSearchingMode
{
    searchFlags.searching = NO;
    itemSearchBar.text = @"";
    [itemSearchBar resignFirstResponder];

    [self.searchListArray removeAllObjects];
    [self reloadCollectionView];
}

@end
