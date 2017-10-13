//
//  DJMessageDataSource.m
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageDataSource.h"
#import "DJMessageModel.h"
@implementation DJMessageDataSource
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"result":[DJMessageModel class]
             };
}
@end
