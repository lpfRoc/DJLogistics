//
//  DJMineTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineTableView.h"
#import "DJMineTableViewCell.h"
static NSString *DJMineTableViewCellIdentifier = @"DJMineTableViewCell";

@interface DJMineTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DJMineTableView
#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        [self registerClass:[DJMineTableViewCell class] forCellReuseIdentifier:DJMineTableViewCellIdentifier];
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJMineTableViewCellIdentifier forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
        {
            DJMineTableViewCellStyle cellStyle = cell.mineTableViewCellStyle;
            if (cellStyle !=  DJMineTableViewCellStyleMineInfo) {
                cell.mineTableViewCellStyle = DJMineTableViewCellStyleMineInfo;
            }

        }
            break;
        case 1:
        {
            DJMineTableViewCellStyle cellStyle = cell.mineTableViewCellStyle;
            if (cellStyle !=  DJMineTableViewCellStyleStationInfo) {
                cell.mineTableViewCellStyle = DJMineTableViewCellStyleStationInfo;
            }
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return AUTO_SIZE(80);
            break;
        case 1:
            return AUTO_SIZE(112);
            break;
            
        default:
            break;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;

    }
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end
