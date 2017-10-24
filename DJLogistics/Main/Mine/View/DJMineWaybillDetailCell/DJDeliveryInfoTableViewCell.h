//
//  DJDeliveryInfoTableViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJMineWayBillModel.h"
@interface DJDeliveryInfoTableViewCell : UITableViewCell
@property (strong, nonatomic)  UILabel *deliveryTitle;//配送信息
@property (strong, nonatomic)  UIImageView *devideLine;//分割线
@property (strong, nonatomic)  UILabel *orderTimeLabel;//接单时间
@property (strong, nonatomic)  UILabel *arriveShopTimeLabel;//到店时间
@property (strong, nonatomic)  UILabel *fetchTimeLabel;//取餐时间
@property (strong, nonatomic)  UILabel *arriveTimeLabel;//送达时间
/** model */
@property (nonatomic,strong) DJMineWayBillModel *model;
@end
