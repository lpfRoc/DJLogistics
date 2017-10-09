//
//  DJUserModel.h
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJUserModel : NSObject
@property(strong, nonatomic)NSString * birthday;//用户生日
@property(strong, nonatomic)NSString * rank;//会员描述
@property(strong, nonatomic)NSString * phone;//手机号
@property(strong, nonatomic)NSString * ID;
@property(strong, nonatomic)NSString * province;//省会
@property(strong, nonatomic)NSString * status;//状态
@property(strong, nonatomic)NSString * openid;
@property(strong, nonatomic)NSString * idnumber;//身份证
@property(strong, nonatomic)NSString * sex;//性别
@property(strong, nonatomic)NSString * lng;//
@property(strong, nonatomic)NSString * site;//站点
@property(strong, nonatomic)NSString * city;//城市
@property(strong, nonatomic)NSString * county;//区
@property(strong, nonatomic)NSString * aid;//用户id
@property(strong, nonatomic)NSString * name;//名称
@property(strong, nonatomic)NSString * point;
@property(strong, nonatomic)NSString * sid;
@property(strong, nonatomic)NSString * type;
@property(strong, nonatomic)NSString * request;
@property(strong, nonatomic)NSString * token;
@property(strong, nonatomic)NSString * email;
@property(strong, nonatomic)NSString * avatar;
@property(strong, nonatomic)NSString * healthnumber;
@property(strong, nonatomic)NSString * lat;
@property(strong, nonatomic)NSString * Register;//注册时间
@property(strong, nonatomic)NSString * address;//地址
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
