//
//  DJMessageCenterTableViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJMessageModel;
@interface DJMessageCenterTableViewCell : UITableViewCell
/** 红色点 */
@property (nonatomic,strong) UIImageView *redDot;

/** 公告标题 */
@property (nonatomic,strong) UILabel *noticeTitleLb;

/** 公告内容 */
@property (nonatomic,strong) UILabel *noticeContentLb;

/** 时间 */
@property (nonatomic,strong) UILabel *timeLb;
/** model */
@property (nonatomic,strong) DJMessageModel *messageModel;
+(CGFloat)getRemarkCellHeightByModel:(DJMessageModel *)model;

@end
