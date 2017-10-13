//
//  NSString+Extension.m
//  DJLogistics
//
//  Created by Roc on 2017/9/30.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
#pragma mark - 手机号码验证  1开头 11位
+ (BOOL)validateMobile:(NSString *)mobile {
    //手机号以1 开头 10个 \d 数字字符
    NSString *phoneRegex = @"^1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

@end
