//
//  DJUserModel.m
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import "DJUserModel.h"

@implementation DJUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"ID"  : @"id",
             @"Register"  : @"register",
             };
}
@end
