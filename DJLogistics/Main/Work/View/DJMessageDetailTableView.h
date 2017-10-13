//
//  DJMessageDetailTableView.h
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJMessageModel;
@interface DJMessageDetailTableView : UITableView
/** model */
@property (nonatomic,strong) DJMessageModel *messageModel;
@end
