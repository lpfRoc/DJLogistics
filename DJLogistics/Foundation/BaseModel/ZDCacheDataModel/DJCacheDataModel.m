//
//  DJCacheDataModel.m
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import "DJCacheDataModel.h"
static NSString *const cacheUserinfoKey = @"CACHE_USERINFO_KEY";                 //用户信息Key
static NSString *const cacheUserLoginCellPhoneKey = @"CACHE_USELOGIONCELLPHONE_KEY";        //用户登录手机号Key
static NSString *const cacheDeviceTokenPhoneKey = @"cacheDeviceTokenPhoneKey";        //推送token

@implementation DJCacheDataModel
static DJCacheDataModel *sharedCacheDataModel = nil;
static dispatch_once_t onceToken;
+ (instancetype)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedCacheDataModel = [[DJCacheDataModel alloc] init];
    });
    return sharedCacheDataModel;
}
#pragma mark 是否自动登录
-(BOOL)isAutoLogin{
    if([[NSUserDefaults standardUserDefaults] objectForKey:cacheUserinfoKey]!=nil){
        
        return YES;
    }
    return NO;
}

#pragma mark - 物流信息

- (void)setUserLoginCellPhone:(NSDictionary *)userLoginCellPhone
{
    if (userLoginCellPhone) {
        [[NSUserDefaults standardUserDefaults] setObject:userLoginCellPhone forKey:cacheUserLoginCellPhoneKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheUserLoginCellPhoneKey];
    }
}
-(NSDictionary *)userLoginCellPhone
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:cacheUserLoginCellPhoneKey];
}

- (void)setPushDeviceToken:(NSDictionary *)pushDeviceToken
{
    if (pushDeviceToken) {
        [[NSUserDefaults standardUserDefaults] setObject:pushDeviceToken forKey:cacheDeviceTokenPhoneKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheDeviceTokenPhoneKey];
    }
}
-(NSDictionary *)pushDeviceToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:cacheDeviceTokenPhoneKey];
}

#pragma mark - 用户信息 本地存储用户登录信息
-(void)setUserInfoData:(NSDictionary *)userInfoData{
    if (userInfoData) {
        [[NSUserDefaults standardUserDefaults] setObject:userInfoData forKey:cacheUserinfoKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheUserinfoKey];
    }
}

-(NSDictionary *)userInfoData{
    return [[NSUserDefaults standardUserDefaults] objectForKey:cacheUserinfoKey];
}
#pragma mark 退出登录清除用户信息
- (void)clearUserInfoWhenLogout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheUserinfoKey];
}

@end
