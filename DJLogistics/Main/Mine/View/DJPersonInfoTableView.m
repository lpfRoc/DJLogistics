//
//  DJPersonInfoTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJPersonInfoTableView.h"
#import "DJPersonInfoTableViewCell.h"

@interface DJPersonInfoTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DJPersonInfoTableView
#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        if (indexPath.section == 0) {
            cell = [[DJPersonInfoTableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: @"DJPersonInfoTableViewCell"];
        }else
        {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: @"cell"];
            cell.textLabel.font = FONT_SIZE(13);
            cell.detailTextLabel.font = FONT_SIZE(13);
            cell.detailTextLabel.textColor = COLOR_FontTitle;
        }

    }

    switch (indexPath.section) {
        case 0:
        {
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"昵称";
                    cell.detailTextLabel .text= DJUser_Info.name;
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"性别";
                    cell.detailTextLabel .text= DJUser_Info.sex;

                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"年龄";
                    cell.detailTextLabel .text= DJUser_Info.lat;
                }
                    break;
                case 3:
                {
                    cell.textLabel.text = @"手机号";
                    cell.detailTextLabel .text= DJUser_Info.phone;
                }
                    break;
            }
            
        }
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
            return AUTO_SIZE(55);
            break;
            
        default:
            break;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end
