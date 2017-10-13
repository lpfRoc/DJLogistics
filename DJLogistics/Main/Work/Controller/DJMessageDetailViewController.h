//
//  DJMessageDetailViewController.h
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJRootViewController.h"
@class DJMessageModel;
@interface DJMessageDetailViewController : DJRootViewController
/** model */
@property (nonatomic,strong) DJMessageModel *messageModel;
@end
