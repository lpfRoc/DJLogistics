//
//  ZDCacheDataModel.h
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDCacheDataModel : NSObject
@property (nonatomic, strong) NSDictionary *userInfoData;   //本地存储用户信息
/**
 *  存储手机号用户清除用户信息后，在登录界面仍可获取手机号
 */
@property (nonatomic, strong) NSDictionary *userLoginCellPhone;   //本地存储用户手机号
/**
 * @brief 创建单例
 */
+ (instancetype)sharedInstance;

/**
 * @brief 是否自动登录
 */
- (BOOL)isAutoLogin;

/**
 * @brief 退出登录清除用户信息
 */
- (void)clearUserInfoWhenLogout;
@end
