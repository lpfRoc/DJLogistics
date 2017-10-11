//
//  DJWaybillDataSource.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWaybillDataSource.h"
#import "DJWaybillModel.h"

@implementation DJWaybillDataSource
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"result":[DJWaybillModel class]
             };
    
}
@end
