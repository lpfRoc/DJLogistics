//
//  DJSendMessageManager.h
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/31.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJSendMessageManager : NSObject
//发短信
-(void)SendMessage:(NSString *)phone message:(NSString *)message;
@end
