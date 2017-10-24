//
//  DJMineWayBillModel.m
//  DJLogistics
//
//  Created by Roc on 2017/10/24.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWayBillModel.h"
#import "DJFoodBillModel.h"
@implementation DJMineWayBillModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"ID"  : @"id",
             };
}

@end
