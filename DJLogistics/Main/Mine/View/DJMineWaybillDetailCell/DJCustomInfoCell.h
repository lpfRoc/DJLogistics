//
//  DJCustomInfoCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DJCustomInfoCellTpe) {
    DJCustomInfoCellTypeDefault,      //不带btn
    DJCustomInfoCellTypeBtn,         //包含btn测cell
};
#import "DJMineWayBillModel.h"

@interface DJCustomInfoCell : UITableViewCell
/** cellstyle */
@property (nonatomic,assign) DJCustomInfoCellTpe customInfoCellTpe;

@property (strong, nonatomic)  UILabel *customInfoTitle;//客户信息
@property (strong, nonatomic)  UIImageView *devideLine;//分割线
@property (strong, nonatomic)  UILabel *customNameLabel;//客户名

@property (strong, nonatomic)  UILabel *phoneLabel;//电话
@property (strong, nonatomic)  UILabel *addressLabel;//地址

/** CallBtn */
@property (nonatomic,strong) UIButton *callBtn;
/** messageBtn */
@property (nonatomic,strong) UIButton *messageBtn;
/** 导航btn */
@property (nonatomic,strong) UIButton *GPSBtn;
/** model */
@property (nonatomic,strong) DJMineWayBillModel *model;
@end
