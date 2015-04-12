//
//  BDGlassImageScroller.m
//  BrintDemo
//
//  Created by Tabrez on 17/08/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BDGlassImageScroller.h"
#import "GlassScrollerInfoView.h"
#import "BTGlassScrollView.h"
#import "Items.h"

@interface BDGlassImageScroller ()

@property(nonatomic) CGRect initialScrollFrame;

@end

@implementation BDGlassImageScroller

@synthesize baseScrollView;
@synthesize dataSourceArray;
@synthesize imagesArray;
@synthesize currentPage;
@synthesize initialScrollFrame;

#define kInitialOffset 199

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    self.dataSourceArray = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  [self setAutomaticallyAdjustsScrollViewInsets:NO];
  self.view.backgroundColor = [UIColor blackColor];

  CGFloat blackSideBarWidth = 2;
  self.initialScrollFrame = self.baseScrollView.frame;

  self.baseScrollView.frame = CGRectMake(0, 0, self.baseScrollView.frame.size.width + imagesArray.count * blackSideBarWidth, self.baseScrollView.frame.size.height);
  self.imagesArray = [[NSMutableArray alloc] init];

  for (Items *items in self.dataSourceArray) {
    UIImageView *temp = [[UIImageView alloc] init];
    [temp sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:items.uri] andPlaceholderImage:[UIImage imageNamed:@"loading.png"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                [self.imagesArray addObject:image];
            }
    }];
  }
  [self reloadScrollView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  NSInteger page = currentPage;
  // resize scrollview can cause setContentOffset off for no reason and screw things up

  CGFloat blackSideBarWidth = 2;
  [baseScrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width + 2 * blackSideBarWidth, self.view.frame.size.height)];

  [baseScrollView setContentSize:CGSizeMake(imagesArray.count * baseScrollView.frame.size.width, self.view.frame.size.height)];

  [baseScrollView setContentOffset:CGPointMake(page * baseScrollView.frame.size.width, baseScrollView.contentOffset.y)];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [baseScrollView setContentSize:CGSizeMake(imagesArray.count * baseScrollView.frame.size.width, baseScrollView.frame.size.height)];
}

- (void)viewWillLayoutSubviews {
  // Use this if your base scroll view starts form 0.0.. it'll add padding to scrollview subview till navigation basr..

  //    for (int index = 0; index < imagesArray.count; index++) {
  //        BTGlassScrollView *glassView = [self glassScrollViewForIndex:index];
  //        [glassView setTopLayoutGuideLength:[self.topLayoutGuide length]];
  //    }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)clearScrollView {
  NSArray *subViews = [baseScrollView subviews];

  for (id view in subViews) {
    [view removeFromSuperview];
  }
}

- (void)reloadScrollView {
  [self clearScrollView];

  for (int index = 0; index < imagesArray.count; index++) {
    UIImage *image = [imagesArray objectAtIndex:index];

    CGRect frame = baseScrollView.bounds;
    frame.origin.x = index * frame.size.width;
    frame.origin.y = 0;

    BTGlassScrollView *glassScrollView = [[BTGlassScrollView alloc] initWithFrame:frame BackgroundImage:image blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customView:index]];
    glassScrollView.tag = kInitialOffset + index;

    [baseScrollView addSubview:glassScrollView];
  }
}

- (GlassScrollerInfoView *)customView:(NSInteger)index {
  CGFloat width = initialScrollFrame.size.width;
  CGFloat hieght = 400;

  NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GlassScrollerInfoView" owner:nil options:nil];
  GlassScrollerInfoView *detailView = (GlassScrollerInfoView *)[nib objectAtIndex:0];
  detailView.frame = CGRectMake(0, 300, width, hieght);

  return detailView;

  UIView *infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, hieght)];

  UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, width - 20, 100)];
  Items *item = [self.dataSourceArray objectAtIndex:index];
  [titleLabel setText:item.name];
  [titleLabel setTextColor:[UIColor whiteColor]];
  [titleLabel setFont:[UIFont fontWithName:HELVETICA_LIGHT_FONT size:80]];
  [titleLabel setShadowColor:[UIColor blackColor]];
  [titleLabel setShadowOffset:CGSizeMake(1, 1)];
  [titleLabel setTextAlignment:NSTextAlignmentCenter];
  [infoView addSubview:titleLabel];

  UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(10, 130, width - 20, 125)];
  subview1.layer.cornerRadius = 3;
  subview1.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
  [infoView addSubview:subview1];

  UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(10, 270, width - 20, 300)];
  subview2.layer.cornerRadius = 3;
  subview2.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
  [infoView addSubview:subview2];

  UIView *subview3 = [[UIView alloc] initWithFrame:CGRectMake(10, 585, width - 20, 125)];
  subview3.layer.cornerRadius = 3;
  subview3.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
  [infoView addSubview:subview3];

  return infoView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  CGFloat ratio = scrollView.contentOffset.x / scrollView.frame.size.width;
  currentPage = (int)floor(ratio);
  if (currentPage < 0) {
    currentPage = 0;
  }
  NSLog(@"%i", currentPage);

  BTGlassScrollView *glassView = [self glassScrollViewForIndex:currentPage];

  [glassView scrollHorizontalRatio:-ratio + currentPage];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  //    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
  //    NSInteger page = (int)floor(ratio);
  //    if (page < 0) {
  //        page = 0;
  //    }
  //
  //    BTGlassScrollView *glassView = [self glassScrollViewForIndex:page];
  //
  //    for (int index = 0; index < imagesArray.count; index ++) {
  //        BTGlassScrollView *glassScrollView = [self glassScrollViewForIndex:index];
  //        [glassScrollView scrollVerticallyToOffset:glassView.foregroundScrollView.contentOffset.y];
  //    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  //    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
  //    NSInteger page = (int)floor(ratio);
  //    if (page < 0) {
  //        page = 0;
  //    }
  //
  //    BTGlassScrollView *glassView = [self glassScrollViewForIndex:page];
  //
  //    [glassView scrollVerticallyToOffset:glassView.foregroundScrollView.contentOffset.y];
}

- (BTGlassScrollView *)glassScrollViewForIndex:(NSInteger)index {
  BTGlassScrollView *glassScrollView = nil;

  NSArray *subViews = [baseScrollView subviews];

  for (id view in subViews) {
    if ([view isKindOfClass:[BTGlassScrollView class]]) {

      BTGlassScrollView *glassView = (BTGlassScrollView *)view;

      if (glassView.tag == (kInitialOffset + index)) {
        glassScrollView = glassView;
        break;
      }
    }
  }

  return glassScrollView;
}

@end
