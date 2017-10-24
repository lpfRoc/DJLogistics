//
//  DJWaybillHistoryDetailTableView.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWaybillHistoryDetailTableView.h"
#import "DJDeliveryInfoTableViewCell.h"
#import "DJMerchantInfoCell.h"
#import "DJOrderInfoCell.h"
#import "DJCustomInfoCell.h"

static NSString *DJDeliveryInfoTableViewCellIdentifier = @"DJDeliveryInfoTableViewCell";
static NSString *DJMerchantInfoCellIdentifier = @"DJMerchantInfoCell";
static NSString *DJOrderInfoCellIdentifier = @"DJOrderInfoCell";
static NSString *DJCustomInfoCellIdentifier = @"DJCustomInfoCell";

@interface DJWaybillHistoryDetailTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DJWaybillHistoryDetailTableView
#pragma mark - Init View
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = COLOR_BG;
        [self registerClass:[DJDeliveryInfoTableViewCell class] forCellReuseIdentifier:DJDeliveryInfoTableViewCellIdentifier];
        [self registerClass:[DJMerchantInfoCell class] forCellReuseIdentifier:DJMerchantInfoCellIdentifier];
        [self registerClass:[DJOrderInfoCell class] forCellReuseIdentifier:DJOrderInfoCellIdentifier];
        [self registerClass:[DJCustomInfoCell class] forCellReuseIdentifier:DJCustomInfoCellIdentifier];

    }
    return self;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
                DJDeliveryInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DJDeliveryInfoTableViewCellIdentifier forIndexPath:indexPath];
            [cell setModel:self.model];
            return cell;
        }
            break;
        case 1:
        {
                DJMerchantInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:DJMerchantInfoCellIdentifier forIndexPath:indexPath];
            [cell setModel:self.model];

            return cell;
        }
            break;
        case 2:
        {
                DJOrderInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:DJOrderInfoCellIdentifier forIndexPath:indexPath];
            [cell setModel:self.model];

            return cell;
        }
            break;
        case 3:
        {
                DJCustomInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:DJCustomInfoCellIdentifier forIndexPath:indexPath];
            [cell setCustomInfoCellTpe:DJCustomInfoCellTypeBtn];
            [cell setModel:self.model];

            return cell;

        }
            break;
    }
    return nil;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            return AUTO_SIZE(105);
            break;
        case 1:
            return AUTO_SIZE(112);
            break;
        case 2:
        {
            NSData *data = [_model.order_detail dataUsingEncoding:(NSUTF8StringEncoding)];
            NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            return AUTO_SIZE(150+dicArr.count*20);

        }
            break;
        case 3:
        {
            if ( 1 ) {
                return AUTO_SIZE(205);
            }else
            {
                return AUTO_SIZE(162);
            }
        }
            break;
    }
    return AUTO_SIZE(100);
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
