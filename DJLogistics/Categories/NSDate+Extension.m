//
//  NSDate+Extension.m
//  Weibo11
//
//  Created by JYJ on 15/12/12.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
static NSDateFormatter *dateFormatter = nil;

- (NSString *)ff_dateDescription {
    
    // 1. 获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2. 判断是否是今天
    if ([calendar isDateInToday:self]) {
        
        NSInteger interval = ABS((NSInteger)[self timeIntervalSinceNow]);


        if (interval < 60) {
            return [NSString stringWithFormat:@"%ld秒前",interval];
        }
        interval /= 60;
        if (interval < 60) {
            return [NSString stringWithFormat:@"%zd 分钟前", interval];
        }
        
        return [NSString stringWithFormat:@"%zd 小时前", interval / 60];
    }
    
    // 3. 昨天
    NSMutableString *formatString = [NSMutableString stringWithString:@" HH:mm"];
    if ([calendar isDateInYesterday:self]) {
        [formatString insertString:@"昨天" atIndex:0];
    } else {
        [formatString insertString:@"MM-dd" atIndex:0];
        
        // 4. 是否当年
        NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self toDate:[NSDate date] options:0];

        if (components.year != 0) {
            [formatString insertString:@"yyyy-" atIndex:0];
        }
    }

    // 5. 转换格式字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat=@"yyyy-MM-dd HH:mm:ss";
//    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
//    fmt.dateFormat = formatString;
    fmt.timeZone = [NSTimeZone localTimeZone];
    return [fmt stringFromDate:self];
}


- (NSInteger)ff_dateweek{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps =[calendar components:(NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal) fromDate:self];
    NSInteger weekday = [comps weekday];
    return weekday;
}

- (NSInteger)ff_dateweekWithyear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps =[calendar components:(NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal) fromDate:self];
    NSInteger week = [comps week];
    return week;
}

+(NSDate *)getDateWithyyyyMMddHHmmssStr:(NSString *)dateStr{
    if(dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        //        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        //        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/CN"]];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    }
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tm = [dateFormatter dateFromString:dateStr];
    return tm;
}

-(NSString *)StringWithyyyyMMddHHmmss{
    if(dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        //        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        //        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/CN"]];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    }
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *tm = [dateFormatter stringFromDate:self];
    return tm;
}


@end
