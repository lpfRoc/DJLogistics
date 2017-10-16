//
//  DJMessageCenterTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageCenterTableView.h"
#import "DJMessageCenterTableViewCell.h"
#import "DJMessageDetailViewController.h"
static NSString *DJMessageCenterTableViewCellIdentifier = @"DJMessageCenterTableViewCell";

@interface DJMessageCenterTableView ()<UITableViewDelegate, UITableViewDataSource>

@end
@implementation DJMessageCenterTableView

#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self registerClass:[DJMessageCenterTableViewCell class] forCellReuseIdentifier:DJMessageCenterTableViewCellIdentifier];
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.messageModelArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DJMessageCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJMessageCenterTableViewCellIdentifier forIndexPath:indexPath];
    DJMessageModel *model = self.messageModelArr[indexPath.section];
    [cell setMessageModel:model];
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DJMessageModel *model = self.messageModelArr[indexPath.section];
//    return [DJMessageCenterTableViewCell getRemarkCellHeightByModel:model];
    return AUTO_SIZE(120);
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DJMessageDetailViewController *detailVC = [[DJMessageDetailViewController alloc] init];
    DJMessageModel *model = self.messageModelArr[indexPath.section];
    detailVC.messageModel = model;
    [self.rootVC.navigationController pushViewController:detailVC animated:YES];
}

@end
