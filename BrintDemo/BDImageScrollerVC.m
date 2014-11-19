//
//  BDImageScrollerVC.m
//  BrintDemo
//
//  Created by Tabrez on 03/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDImageScrollerVC.h"
#import "BDScrollerCell.h"
#import "BDCollectionItemInfo.h"
#import "BDImageScrollerPanel.h"

@interface BDImageScrollerVC ()

@property (strong, nonatomic) NSMutableArray *imagesArray;

@end


@implementation BDImageScrollerVC

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
    
    [self.imageCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BDScrollerCell class]) bundle:nil]
              forCellWithReuseIdentifier:NSStringFromClass([BDScrollerCell class])];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.imagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"],[UIImage imageNamed:@"j6.png"],[UIImage imageNamed:@"j7.png"],[UIImage imageNamed:@"j8.png"],[UIImage imageNamed:@"j9.png"], [UIImage imageNamed:@"g37.png"],[UIImage imageNamed:@"j4.png"],[UIImage imageNamed:@"j5.png"], nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger sections = [self.dataSourceArray count];
    
    // Remove this once you get data source..
    sections = 1;
    
    DBLog(@"sections = %d",sections);
    
    return sections;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger items = 0;
    
    if (section < self.dataSourceArray.count) {
        NSMutableArray *sectionArray = [dataSourceArray objectAtIndex:section];
        items = [sectionArray count];
    }
    
    // Remove this once you get data source..
    items = imagesArray.count;

    return items;
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BDScrollerCell *cell = nil;
    static NSString *cellIdentifier = @"BDScrollerCell";
    
    cell = (BDScrollerCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    BDCollectionItemInfo *info = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor greenColor];
    }
    else {
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    cell.imageView.image = [imagesArray objectAtIndex:indexPath.row];
    
//    [cell.imageView setImageWithURL:[NSURL imageUrlFromString:info.imageUrl] placeholderImage:nil success:^(UIImage *image, BOOL cached) {
//        DBLog(@"sucess = %@, cached = %d",image, cached);
//    } failure:^(NSError *error) {
//        DBLog(@"error = %@",[error localizedDescription]);
//    }];
    
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(1023, 610);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}


#pragma mark - UICollectionView Delegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BDImageScrollerPanel *modalPanel = [[BDImageScrollerPanel alloc] initWithFrame:CGRectMake(0,20, self.view.frame.size.width, self.view.frame.size.height - 110) title:nil];
    
	/////////////////////////////////
	// Randomly use the blocks method, delgate methods, or neither of them
	int blocksDelegateOrNone = arc4random() % 3;
	
	blocksDelegateOrNone = 0;
	////////////////////////
	// USE BLOCKS
	if (0 == blocksDelegateOrNone) {
		///////////////////////////////////////////
		// The block is responsible for closing the panel,
		//   either with -[UAModalPanel hide] or -[UAModalPanel hideWithOnComplete:]
		//   Panel is a reference to the modalPanel
		modalPanel.onClosePressed = ^(UAModalPanel* panel) {
			// [panel hide];
			[panel hideWithOnComplete:^(BOOL finished) {
				[panel removeFromSuperview];
			}];
			UADebugLog(@"onClosePressed block called from panel: %@", modalPanel);
		};
		
		///////////////////////////////////////////
		//   Panel is a reference to the modalPanel
		modalPanel.onActionPressed = ^(UAModalPanel* panel) {
			UADebugLog(@"onActionPressed block called from panel: %@", modalPanel);
		};
		
		UADebugLog(@"UAModalView will display using blocks: %@", modalPanel);
        
        ////////////////////////
        // USE DELEGATE
	}
	
	
	///////////////////////////////////
	// Add the panel to our view
	[self.view addSubview:modalPanel];
	
	///////////////////////////////////
	// Show the panel from the center of the button that was pressed
	[modalPanel showFromPoint:[collectionView center]];
}



@end
