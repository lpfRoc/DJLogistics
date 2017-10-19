//
//  DJWayBillCenterViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWayBillCenterViewController.h"
#import "XTSegmentControl.h"
#import <iCarousel/iCarousel.h>
#import "DJFinishWayBillViewController.h"
#import "DJDispatchingViewController.h"
@interface DJWayBillCenterViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (strong, nonatomic) XTSegmentControl *mySegmentControl;
@property (strong, nonatomic) iCarousel *carousel;
@property (strong, nonatomic) NSArray *titlesArray;
@end

@implementation DJWayBillCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"运单中心";
    self.view.backgroundColor = COLOR_BG;
    [self setUpHeaderSegmentControl];
    _carousel = ({
        iCarousel *icarousel = [[iCarousel alloc] init];
        icarousel.dataSource = self;
        icarousel.delegate = self;
        icarousel.type = iCarouselTypeLinear;
        icarousel.pagingEnabled = YES;
        icarousel.clipsToBounds = YES;
        icarousel.bounces = NO;
        //平台日历入口跳转到对应item
        icarousel.currentItemIndex = 0;
        [self.view addSubview:icarousel];
        [icarousel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(AUTO_SIZE(50), 0, 0, 0));
        }];
        icarousel;
    });
    
    [self addBarButtonItem];
}
- (void)addBarButtonItem{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 24, 23);
        [button setImage:IMAGE_BUNDLE_(@"icon_contact_kefu") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)rightBarButtonItemClick
{
    DJLog(@"客服");
}
#pragma mark - 初始化头部滑动title
- (void)setUpHeaderSegmentControl
{
    self.navigationItem.title = @"我的福利";
    __weak typeof(self) weakSelf = self;
    self.mySegmentControl = [[XTSegmentControl alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, AUTO_SIZE(50)) Items:self.titlesArray selectedBlock:^(NSInteger index) {
        [weakSelf.carousel scrollToItemAtIndex:index animated:NO];
    }];
    [self.view addSubview:self.mySegmentControl];
    [self.mySegmentControl selectIndex:0];
    
}
- (void)carouselDidScroll:(iCarousel *)carousel{
    if (_mySegmentControl) {
        float offset = carousel.scrollOffset;
        if (offset > 0) {
            [_mySegmentControl moveIndexWithProgress:offset];
        }
    }
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (_mySegmentControl) {
        _mySegmentControl.currentIndex = carousel.currentItemIndex;
    }
}


#pragma mark - iCarouselDelegate, iCarouselDataSource
- (NSArray*)titlesArray
{
    if (nil == _titlesArray) {
        _titlesArray = @[@"配送中", @"已完成"];
    }
    return _titlesArray;
}
#pragma mark iCarousel M
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return [self.titlesArray count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    UIView * myView = view;
    UIViewController * controller ;
    switch (index) {
        case 0:
        {
            DJDispatchingViewController *dispatchingViewController = [[DJDispatchingViewController alloc] init];
            controller = dispatchingViewController;
        }
            break;
        case 1:
        {
            DJFinishWayBillViewController *finishVC = [[DJFinishWayBillViewController alloc] init];
            controller = finishVC;
            
        }
            break;
    }
    
    [self addChildViewController:controller];
    
    
    myView = controller.view;
    myView.frame = carousel.bounds;
    return myView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
