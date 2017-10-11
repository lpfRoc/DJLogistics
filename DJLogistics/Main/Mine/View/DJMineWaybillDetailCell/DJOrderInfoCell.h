//
//  DJOrderInfoCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJOrderInfoCell : UITableViewCell
@property (strong, nonatomic)  UILabel *orderTitle;//订单信息
@property (strong, nonatomic)  UIImageView *devideLine;//分割线
@property (strong, nonatomic)  UILabel *menuLabel;//菜单

@property (strong, nonatomic)  UILabel *moneyLabel;//合计钱
@property (strong, nonatomic)  UILabel *remarkLabel;//备注
@property (strong, nonatomic)  UILabel *platformLabel;//平台
@end
