//
//  BrinDemoCollectionViewController.h
//  BrintDemo
//
//  Created by Pradeep on 04/07/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SearchOptions) {
    SearchItemInvalid = -1,
    SearchItemByName = 0,
    SearchItemByValue,
    SearchItemByMetal
};


typedef struct searchBarFlags {
    BOOL doneClicked;
    BOOL clearClicked;
    BOOL searching;
} SearchBarFlags;

@interface BrinDemoCollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
//@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionView;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UISearchBar *itemSearchBar;
@property (weak, nonatomic) IBOutlet UISlider *rangeSlider;
@property (weak, nonatomic) IBOutlet UILabel *minValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxValueLabel;


@property (nonatomic) SearchBarFlags searchFlags;
@property (nonatomic) CGFloat sliderRangeValue;
@property (strong, nonatomic) NSMutableArray *searchListArray;
@property (nonatomic) SearchOptions selectedSearchOption;
@property (strong, nonatomic) NSMutableArray *dataSourceArray;
@property (strong, nonatomic) NSMutableArray *imagesArray;

- (IBAction)rangeSliderValueChanged:(id)sender;
- (IBAction)rangeSliderValueEditingDidEnd:(id)sender;

@end
