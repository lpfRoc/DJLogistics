//
//  NSDate+Extension.h
//  Weibo11
//
//  Created by JYJ on 15/12/12.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/// 日期描述字符串
///
/// 格式如下
///     -   刚刚(一分钟内)
///     -   X分钟前(一小时内)
///     -   X小时前(当天)
///     -   昨天 HH:mm(昨天)
///     -   MM-dd HH:mm(一年内)
///     -   yyyy-MM-dd HH:mm(更早期)
- (NSString *)ff_dateDescription;

// 星期几（注意，周日是“1”，周一是“2”。。。。）
- (NSInteger)ff_dateweek;
- (NSInteger)ff_dateweekWithyear;

+(NSDate *)getDateWithyyyyMMddHHmmssStr:(NSString *)dateStr;
-(NSString *)StringWithyyyyMMddHHmmss;
@end
