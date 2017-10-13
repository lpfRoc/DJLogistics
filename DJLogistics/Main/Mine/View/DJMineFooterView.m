//
//  DJMineFooterView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineFooterView.h"
#import "DJMineFooterCollectionViewCell.h"
static NSString *DJMineFooterCollectionViewCellIdentifier = @"DJMineFooterCollectionViewCell";

@interface DJMineFooterView ()<UICollectionViewDelegate,UICollectionViewDataSource>
/** modelArr */
@property (nonatomic,strong) NSArray *modelArr;
@end

@implementation DJMineFooterView

#pragma mark -lazy
- (UILabel *)describeTitle
{
    if (_describeTitle== nil) {
        _describeTitle = [[UILabel alloc] init];
        _describeTitle.font = FONT_SIZE(14);
        _describeTitle.textAlignment = NSTextAlignmentLeft;
        _describeTitle.textColor = COLOR_FontText;
        _describeTitle.text = @"工作历史";
        
    }
    return _describeTitle;
}
- (UIImageView *)icon
{
    if (_icon == nil) {
        
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mineselect"]];
    }
    return _icon;
}
- (UIImageView *)arrow
{
    if (_arrow == nil) {
        
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_arrow"]];
    }
    return _arrow;
}
- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UICollectionView *)workCollectionView
{
    if (_workCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((UI_SCREEN_WIDTH -30 - 3*10)/4 , AUTO_SIZE(82));
        layout.minimumLineSpacing = 10;
        _workCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _workCollectionView.showsVerticalScrollIndicator = NO;
        _workCollectionView.showsHorizontalScrollIndicator = NO;
        _workCollectionView.scrollEnabled = NO;
        _workCollectionView.delegate = self;
        _workCollectionView.dataSource = self;
        _workCollectionView.decelerationRate = 0;
        _workCollectionView.backgroundColor = COLOR_W;
        [_workCollectionView registerClass:[DJMineFooterCollectionViewCell class] forCellWithReuseIdentifier:DJMineFooterCollectionViewCellIdentifier];
    }
    return _workCollectionView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_icon mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(20));
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_describeTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_icon.mas_centerY);
        make.left.equalTo(_icon.mas_right).with.offset(AUTO_SIZE(10));
    }];
    [_arrow mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_icon.mas_centerY);
        make.right.equalTo(self.mas_right).with.offset(AUTO_SIZE(-20));
        make.size.mas_equalTo(CGSizeMake(8, 15));
    }];
    [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_icon.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.mas_left).with.offset(AUTO_SIZE(15));
        make.height.equalTo(@(ISRetina_Min_Line));
        make.width.equalTo(@(UI_SCREEN_WIDTH -AUTO_SIZE(15) ));
    }];
    [_workCollectionView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
}
#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame   {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_W;
        [self initSubViews];
        [self initData];
    }
    return self;
}
- (void)initData
{
    self.modelArr = @[
                      @{@"title":@"今日运单",
                        @"titleColor":COLOR_BlueDark,
                        @"contentColor":COLOR_BlueDark},
                      
                      @{@"title":@"已完成",
                        @"titleColor":COLOR_FontTitle,
                        @"contentColor":COLOR_Blue},
                      
                      @{@"title":@"进行中",
                        @"titleColor":COLOR_FontTitle,@"contentColor":COLOR_Yellow},
                      
                      @{@"title":@"超时",
                        @"titleColor":COLOR_FontTitle,@"contentColor":COLOR_Orange},
                      
                      @{@"title":@"本月运单",
                        @"titleColor":COLOR_BlueDark,@"contentColor":COLOR_BlueDark},
                      
                      @{@"title":@"已完成",
                        @"titleColor":COLOR_FontTitle,@"contentColor":COLOR_Blue},
                      
                      @{@"title":@"进行中",
                        @"titleColor":COLOR_FontTitle,@"contentColor":COLOR_Yellow},
                      
                      @{@"title":@"超时",
                        @"titleColor":COLOR_FontTitle,@"contentColor":COLOR_Orange}];
}
- (void)initSubViews
{
    NSArray *viewArray = @[self.icon,self.describeTitle,self.arrow,self.devideLine,self.workCollectionView
                           ];
    for (UIView *view in viewArray) {
        [self addSubview:view];
    }
    [self autoLayout];
}
#pragma mark - collection delegate/datasource
//边距设置:整体边距的优先级，始终高于内部边距的优先级
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 0, 15);//分别为上、左、下、右
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    DJMineFooterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DJMineFooterCollectionViewCellIdentifier forIndexPath:indexPath];
    
    NSMutableDictionary *modeDic = [self.modelArr[indexPath.item] mutableCopy];

    [cell setModeDic:modeDic];
    
    [cell setContent:self.dataArr[indexPath.item]];
    
    return cell;
}

@end


