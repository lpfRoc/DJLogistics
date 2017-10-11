//
//  DJMerchantInfoCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJMerchantInfoCell : UITableViewCell
@property (strong, nonatomic)  UILabel *merchantTitle;//商家信息
@property (strong, nonatomic)  UIImageView *devideLine;//分割线
@property (strong, nonatomic)  UILabel *merchantName;//店名
@property (strong, nonatomic)  UILabel *addressLabel;//地址
/** 导航btn */
@property (nonatomic,strong) UIButton *GPSBtn;
@end
