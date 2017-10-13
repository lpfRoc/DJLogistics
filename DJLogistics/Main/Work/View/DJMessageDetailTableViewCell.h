//
//  DJMessageDetailTableViewCell.h
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJMessageModel;

@interface DJMessageDetailTableViewCell : UITableViewCell

/** model */
@property (nonatomic,strong) DJMessageModel *messageModel;
/** 消息标题 */
@property (nonatomic,strong) UILabel *messageTitleLb;

/** 消息内容 */
@property (nonatomic,strong) UILabel *messageContentLb;

/** 时间 */
@property (nonatomic,strong) UILabel *timeLb;
@end
