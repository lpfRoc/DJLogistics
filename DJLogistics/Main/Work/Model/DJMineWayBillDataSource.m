//
//  DJMineWayBillDataSource.m
//  DJLogistics
//
//  Created by Roc on 2017/10/24.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWayBillDataSource.h"
#import "DJMineWayBillModel.h"
@implementation DJMineWayBillDataSource
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"result":[DJMineWayBillModel class]
             };
    
}
@end
