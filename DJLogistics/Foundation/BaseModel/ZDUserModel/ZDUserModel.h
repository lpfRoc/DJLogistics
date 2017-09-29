//
//  ZDUserModel.h
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDUserModel : NSObject
@property(strong, nonatomic)NSString * cmAccount;//用户编号
@property(strong, nonatomic)NSString * cmCustomerId;//用户ID
@property(strong, nonatomic)NSString * cmCellphone;//手机号
@property(strong, nonatomic)NSString * cmIdnum;//用户身份证号 有身份证代表已认证
@property(strong, nonatomic)NSString * cmRealName;//用户名字
@property(strong, nonatomic)NSString * cmStatus;//状态
@property(strong, nonatomic)NSString * cmEmployee;//是否是员工 0:否1:是
@property(strong, nonatomic)NSString * cmInviteCode;//邀请码
@property(strong, nonatomic)NSString * cmIntroduceCode;//介绍人码
@property(strong, nonatomic)NSString * sessionToken;//单点登录用的token
@property(strong, nonatomic)NSString * token;//推送token
@property(strong, nonatomic)NSString * deviceId;//设备Id
@property(strong, nonatomic)NSString * qrCode;//二维码URL
@property(strong, nonatomic)NSString * cmNumToken;//用户加密字段
@property(strong, nonatomic)NSString * shareRedUrl;//登录分享红包url
@property(strong, nonatomic)NSString * isSetPayPassword;//是否设置交易密码
@property(strong, nonatomic)NSString * isAuth;//是否实名认证
@property(strong, nonatomic)NSString * validaCode;
@property(strong, nonatomic)NSString * integral;


/**
 *  本地增加是否绑定银行卡字段
 */
@property(assign, nonatomic)BOOL  isBindBnakCard;//是否实名认证

/**
 *  首次注册登录标识
 */
@property(assign, nonatomic)BOOL  isRegisterLogin;
@end
