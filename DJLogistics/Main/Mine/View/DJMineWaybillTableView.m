//
//  DJMineWaybillTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWaybillTableView.h"
#import "DJMineWaybillTableViewCell.h"
static NSString *DJMineWaybillTableViewCellIdentifier = @"DJMineWaybillTableViewCell";

@interface DJMineWaybillTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DJMineWaybillTableView

#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        [self registerClass:[DJMineWaybillTableViewCell class] forCellReuseIdentifier:DJMineWaybillTableViewCellIdentifier];
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJMineWaybillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJMineWaybillTableViewCellIdentifier forIndexPath:indexPath];
    DJWaybillModel *model = self.dataArr[indexPath.section];
    [cell setModel:model];
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO_SIZE(140);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = COLOR_BG;
    UILabel *timeLb = [[UILabel alloc] init];
    timeLb.font = FONT_SIZE(11);
    timeLb.textColor = COLOR_BlueDark;
    timeLb.textAlignment = NSTextAlignmentLeft;
    timeLb.text = @"2017-10-10";
    [bgView addSubview:timeLb];
    [timeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(bgView.mas_centerY);
        make.left.equalTo(bgView.mas_left).with.offset(AUTO_SIZE(20));
    }];
    return bgView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
