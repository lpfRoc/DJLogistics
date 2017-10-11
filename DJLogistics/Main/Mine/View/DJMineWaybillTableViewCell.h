//
//  DJMineWaybillTableViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJWaybillModel;
@interface DJMineWaybillTableViewCell : UITableViewCell
/** model */
@property (nonatomic,strong) DJWaybillModel *model;

@property (strong, nonatomic)  UILabel *titleLabel;//标题
@property (strong, nonatomic)  UILabel *overtimeLabel;//超时lb

@property (strong, nonatomic)  UIImageView *addressIcon;//地址信息icon
@property (strong, nonatomic)  UIImageView *deliveryIcon;//外卖icon
@property (strong, nonatomic)  UILabel *deliveryNameLabel;//外卖名字
@property (strong, nonatomic)  UILabel *addressInfoLabel;//地址信息名称
@property (strong, nonatomic)  UILabel *orderTimeLabel;//接单时间
@property (strong, nonatomic)  UILabel *arriveShopTimeLabel;//到店时间
@property (strong, nonatomic)  UILabel *fetchTimeLabel;//取餐时间
@property (strong, nonatomic)  UILabel *arriveTimeLabel;//送达时间

@end
