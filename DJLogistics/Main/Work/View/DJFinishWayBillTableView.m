//
//  DJFinishWayBillTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJFinishWayBillTableView.h"
#import "DJMineWaybillTableViewCell.h"
#import "DJWaybillModel.h"
#import "DJWaybillHistoryDetailController.h"
static NSString *DJFinishWayBillTableViewCellIdentifier = @"DJFinishWayBillTableViewCell";

@interface DJFinishWayBillTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DJFinishWayBillTableView

#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        self.estimatedRowHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        [self registerClass:[DJMineWaybillTableViewCell class] forCellReuseIdentifier:DJFinishWayBillTableViewCellIdentifier];
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJMineWaybillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJFinishWayBillTableViewCellIdentifier forIndexPath:indexPath];
    DJWaybillModel *model = self.dataArr[indexPath.row];
    [cell setModel:model];
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DJWaybillModel *model = self.dataArr[indexPath.row];
    return [DJMineWaybillTableViewCell getWaybillCellHeightByModel:model];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DJWaybillHistoryDetailController *conteroller = [[DJWaybillHistoryDetailController alloc] init];
    conteroller.model = self.dataArr[indexPath.row];
   [self.rootVc.navigationController pushViewController:conteroller animated:YES];
}


@end
