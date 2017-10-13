//
//  DJMessageDetailTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageDetailTableView.h"
#import "DJMessageDetailTableViewCell.h"
#import "DJMessageModel.h"
static NSString *DJMessageDetailTableViewCellIdentifier = @"DJMessageDetailTableViewCell";

@interface DJMessageDetailTableView ()<UITableViewDelegate, UITableViewDataSource>

@end
@implementation DJMessageDetailTableView

#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        [self registerClass:[DJMessageDetailTableViewCell class] forCellReuseIdentifier:DJMessageDetailTableViewCellIdentifier];
        
        
    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJMessageDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJMessageDetailTableViewCellIdentifier forIndexPath:indexPath];
    [cell setMessageModel:_messageModel];
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UI_SCREEN_HEIGHT;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
