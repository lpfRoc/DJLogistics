//
//  ZDContextModel.h
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZDUserModel;
@interface ZDContextModel : NSObject
@property (nonatomic,strong) ZDUserModel *currentUserInfo;     //用户信息
/**
 * @brief 创建单例
 */
+ (instancetype)sharedInstance;
@end
