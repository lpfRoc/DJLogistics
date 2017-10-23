//
//  DJAppManagerInit.m
//  DJLogistics
//
//  Created by Roc on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJAppManagerInit.h"





@implementation DJAppManagerInit
//单例
OCT_SYNTHESIZE_SINGLETON_FOR_CLASS(DJAppManagerInit);

+(void)config{
    [self configXGPush];
}

+ (void)configXGPush
{
    //打开debug开关
    XGSetting *setting = [XGSetting getInstance];
    [setting enableDebug:YES];
    
    /**
     初始化信鸽
     
     @param appId 通过前台申请的应用ID
     @param appKey 通过前台申请的appKey
     */
    [XGPush startApp:2200268867 appKey:kXGAppKey];
    
}


@end
