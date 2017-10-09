//
//  DJMineTableViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DJMineTableViewCellStyle) {
   DJMineTableViewCellStyleMineleInit,   //默认
    DJMineTableViewCellStyleMineInfo,      //我的信息cell
    DJMineTableViewCellStyleStationInfo,         //站点信息cell
};

@interface DJMineTableViewCell : UITableViewCell
/** cellstyle */
@property (nonatomic,assign) DJMineTableViewCellStyle mineTableViewCellStyle;

@property (strong, nonatomic)  UIImageView *iconImageView;//头像
@property (strong, nonatomic)  UILabel *nameLabel;//名字
@property (strong, nonatomic)  UILabel *phoneLabel;//手机号

@property (strong, nonatomic)  UIImageView *stationIcon;//站点信息icon
@property (strong, nonatomic)  UIImageView *devideLine;//分割线
@property (strong, nonatomic)  UILabel *stationInfoDescLabel;//站点信息
@property (strong, nonatomic)  UILabel *stationNameLabel;//站点名称
@property (strong, nonatomic)  UILabel *stationDetailLabel;//站点位置详情

@end
